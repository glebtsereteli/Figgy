/// @desc Methods

MoveX = function(_accel, _decel) {
	var _input = InputX(INPUT_CLUSTER.NAV);
	var _xSpd = cfg.MoveSpeed * _input;
	var _xStep = ((_input != 0) ? _accel : _decel);
	xSpd = lerp(xSpd, _xSpd, _xStep);
};
MoveXAir = function() {
	MoveX(cfg.AirAcceleration, cfg.AirDeceleration);
};
ApplyGravity = function() {
	ySpd = min(ySpd + cfg.Gravity, cfg.MaxFallSpeed);
};
UpdateFacing = function() {
	if (xSpd != 0) {
		facing = sign(xSpd);
	}
};
ResetJumps = function() {
	nJumps = cfg.MaxJumps;
};
MoveCollide = function() {
	xSpdFrac += xSpd;
	ySpdFrac += ySpd;
	var _xSpd = round(xSpdFrac);
	var _ySpd = round(ySpdFrac);
	xSpdFrac -= _xSpd;
	ySpdFrac -= _ySpd;
	
	repeat (abs(_xSpd)) {
	    if (place_meeting(x + sign(_xSpd), y, colliders)) {
	        xSpd = 0;
	        break;
		}
		x += sign(_xSpd);
	}
	repeat (abs(_ySpd)) {
	    if (place_meeting(x, y + sign(_ySpd), colliders)) {
	        ySpd = 0;
	        break;
		}
		y += sign(_ySpd);
	}
};

UpdateSprite = function() {
	sprite_index = sprites[$ cfg.Skin][$ fsm.get_current_state()];
	image_index = 0;
};

FsmEnter = function() {
	UpdateSprite();
};

IsTryingToMove = function() {
	return (InputX(INPUT_CLUSTER.NAV) != 0);
};
IsMoving = function() {
	return (xSpd != 0);
};
IsTryingToMoveOrMoving = function() {
	return (IsTryingToMove() or IsMoving());
};
IsStill = function() {
	return (not IsMoving());
};
IsGrounded = function() {
	return place_meeting(x, y + 1, colliders);
};
IsMidair = function() {
	return (not IsGrounded());
};
IsFalling = function() {
	return (ySpd > 0);
};
IsCoyoteLeft = function() {
	return (coyote > 0);
};
