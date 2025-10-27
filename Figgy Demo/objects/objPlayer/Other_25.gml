/// @desc FSM

fsm = new SnowState("idle", false);
fsm

.add("idle", {
	enter: function() {
		ResetJumps();
		sprite_index = sprPlayerIdle;
	},
	update: function() {
		fsm.trigger("t_run");
	},
})
.add("run", {
	enter: function() {
		ResetJumps();
		sprite_index = sprPlayerRun;
	},
	update: function() {
		MoveX(cfg.GroundAcceleration, cfg.GroundDeceleration);
		UpdateFacing();
		fsm.trigger("t_idle");
	},
})
.add("jump", {
	enter: function() {
		ySpd = -cfg.JumpSpeed;
		nJumps = max(nJumps - 1, 0);
		InputVerbConsume(INPUT_VERB.JUMP);
		sprite_index = sprPlayerJump;
	},
	update: function() {
		MoveXAir();
		ApplyGravity();
		UpdateFacing();
	},
})
.add("fall", {
	enter: function() {
		if (fsm.get_previous_state() != "jump") {
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

.add_transition("t_run", "idle", "run", IsTryingToMove)
.add_transition("t_idle", "run", "idle", IsStill)
.add_transition("t_jump", ["idle", "run"], "jump", function() {
	return (IsGrounded() and not place_meeting(x, y - 1, colliders));
})
.add_transition("t_jump", "fall", "jump", function() {
	return (IsCoyoteLeft() or (nJumps > 0));
})
.add_transition("t_jump", "jump", "jump", function() {
	return (nJumps > 0);
})
.add_transition("t_fall", ["idle", "run"], "fall")
.add_transition("t_fall", "jump", "fall", IsFalling)
.add_transition("t_land", ["jump", "fall"], "idle", IsStill)
.add_transition("t_land", ["jump", "fall"], "run", IsTryingToMoveOrMoving)

.on("state changed", function(_to, _from) {
	show_debug_message($"PLAYER: State chanced from \"{_from}\" to \"{_to}\".");
});
