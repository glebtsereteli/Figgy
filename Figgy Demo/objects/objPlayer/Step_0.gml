
xSpd = cfg.MoveSpeed * InputX(INPUT_CLUSTER.NAV);

if (InputBufferPressed(INPUT_VERB.JUMP, cfg.JumpBuffer) and IsGrounded()) {
	ySpd = -cfg.JumpSpeed;
}

ySpd = min(ySpd + cfg.Gravity, cfg.MaxFallSpeed);

MoveCollide();
