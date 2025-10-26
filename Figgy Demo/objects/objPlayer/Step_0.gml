
var _xInput = InputX(INPUT_CLUSTER.NAV);
var _xSpd = cfg.MoveSpeed * _xInput;
var _xStep = ((_xInput != 0)
	? (IsGrounded() ? cfg.GroundAcceleration : cfg.AirAcceleration)
	: (IsGrounded() ? cfg.GroundDeceleration : cfg.AirDeceleration)
);
xSpd = lerp(xSpd, _xSpd, _xStep);

if (InputBufferPressed(INPUT_VERB.JUMP, cfg.JumpBuffer) and IsGrounded()) {
	ySpd = -cfg.JumpSpeed;
}

ySpd = min(ySpd + cfg.Gravity, cfg.MaxFallSpeed);

MoveCollide();
