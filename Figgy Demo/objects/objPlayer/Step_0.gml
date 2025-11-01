
fsm.update();
MoveCollide();

if (not (InputBufferPressed(INPUT_VERB.JUMP, cfg.JumpBuffer) and fsm.trigger("tJump"))) {
	if (IsMidair()) fsm.trigger("tFall");
	if (IsGrounded()) fsm.trigger("tLand");
}

// Light:
var _cfg = cfg.Light;
light.x = x;
light.y = GetYCenter();
light.xscale = _cfg.XScale;
light.yscale = _cfg.YScale;
light.intensity = _cfg.Intensity;
light.blend = _cfg.Color;
