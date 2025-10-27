/// @desc FSM

fsm = new SnowState("Idle", false);
fsm

.event_set_default_function("enter", UpdateSprite)

.add("Idle", {
	enter: function() {
		FsmEnter();
		ResetJumps();
	},
	update: function() {
		fsm.trigger("tRun");
	},
})
.add("Run", {
	enter: function() {
		FsmEnter();
		ResetJumps();
	},
	update: function() {
		MoveX(cfg.GroundAcceleration, cfg.GroundDeceleration);
		UpdateFacing();
		fsm.trigger("tIdle");
	},
})
.add("Jump", {
	enter: function() {
		FsmEnter();
		ySpd = -cfg.JumpSpeed;
		nJumps = max(nJumps - 1, 0);
		InputVerbConsume(INPUT_VERB.JUMP);
	},
	update: function() {
		MoveXAir();
		ApplyGravity();
		UpdateFacing();
	},
})
.add("Fall", {
	enter: function() {
		FsmEnter();
		if (fsm.get_previous_state() != "Jump") {
			coyote = cfg.CoyoteTime;
		}
	},
	update: function() {
		MoveXAir();
		ApplyGravity();
		UpdateFacing();
		coyote = max(coyote - 1, 0);
	},
	leave: function() {
		coyote = 0;
	},
})

.add_transition("tRun", "Idle", "Run", IsTryingToMove)
.add_transition("tIdle", "Run", "Idle", IsStill)
.add_transition("tJump", ["Idle", "Run"], "Jump", function() {
	return (IsGrounded() and not place_meeting(x, y - 1, colliders));
})
.add_transition("tJump", "Fall", "Jump", function() {
	return (IsCoyoteLeft() or (nJumps > 0));
})
.add_transition("tJump", "Jump", "Jump", function() {
	return (nJumps > 0);
})
.add_transition("tFall", ["Idle", "Run"], "Fall")
.add_transition("tFall", "Jump", "Fall", IsFalling)
.add_transition("tLand", ["Jump", "Fall"], "Idle", IsStill)
.add_transition("tLand", ["Jump", "Fall"], "Run", IsTryingToMoveOrMoving)

.on("state changed", function(_to, _from) {
	show_debug_message($"PLAYER: State chanced from \"{_from}\" to \"{_to}\".");
});
