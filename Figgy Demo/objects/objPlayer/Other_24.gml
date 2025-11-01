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
ReduceJumps = function() {
	nJumps = max(nJumps - 1, 0);
};
ResetJumps = function() {
	nJumps = cfg.MaxJumps;
};

MoveCollide = function() {
	MoveCollideX();
	MoveCollideY();
};
MoveCollideX = function() {
	xSpdFrac += xSpd;
	var _xSpd = round(xSpdFrac);
	xSpdFrac -= _xSpd;
	
	repeat (abs(_xSpd)) {
	    if (place_meeting(x + sign(_xSpd), y, colliders)) {
	        xSpd = 0;
	        break;
		}
		x += sign(_xSpd);
	}
};
MoveCollideY = function() {
	static _SkipCorner = function(_ySpd) {
		if (_ySpd >= 0) return false;
		
		var _corrected = false;
		for (var _i = 1; _i <= cfg.CornerTolerance; _i++) {
		    if (not place_meeting(x - _i, y + _ySpd, colliders)) {
		        x -= _i;
		        _corrected = true;
		        break;
		    }
		    if (not place_meeting(x + _i, y + _ySpd, colliders)) {
		        x += _i;
		        _corrected = true;
		        break;
		    }
		}
		
		return _corrected;
	};
	
	ySpdFrac += ySpd;
	var _ySpd = round(ySpdFrac);
	ySpdFrac -= _ySpd;
	
	var _sign = sign(_ySpd);
	repeat (abs(_ySpd)) {
		if (place_meeting(x, y + _sign, colliders) and not _SkipCorner(_ySpd)) {
		    ySpd = 0;
		    break;
		}
		y += _sign;
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
