
xSpd = moveSpd * InputX(INPUT_CLUSTER.NAV);

if (InputBufferPressed(INPUT_VERB.JUMP, 7) and IsGrounded()) {
	ySpd = -jumpSpd;
}

ySpd = min(ySpd + grav, maxFallSpd);

MoveCollide();
