
fsm.update();
MoveCollide();

if (InputBufferPressed(INPUT_VERB.JUMP, cfg.JumpBuffer) and fsm.trigger("tJump")) exit;
if (IsMidair()) fsm.trigger("tFall");
if (IsGrounded()) fsm.trigger("tLand");
