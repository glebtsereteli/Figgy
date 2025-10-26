
fsm.update();
MoveCollide();

if (InputBufferPressed(INPUT_VERB.JUMP, cfg.JumpBuffer) and fsm.trigger("t_jump")) exit;
if (IsMidair()) fsm.trigger("t_fall");
if (IsGrounded()) fsm.trigger("t_land");
