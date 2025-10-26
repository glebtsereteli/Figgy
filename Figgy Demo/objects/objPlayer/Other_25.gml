/// @desc FSM

fsm = new SnowState("idle");
fsm

.add("idle", {
	update: function() {
		fsm.trigger("t_run");
	},
})
.add("run", {
	update: function() {
		MoveX(cfg.GroundAcceleration, cfg.GroundDeceleration);
		fsm.trigger("t_idle");
	},
})
.add("jump", {
	enter: function() {
		ySpd = -cfg.JumpSpeed;
		coyote = 0;
	},
	update: function() {
		MoveXAir();
		ApplyGravity();
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
		coyote = max(coyote - 1, 0);
	},
	leave: function() {
		coyote = 0;
	},
})

.add_transition("t_run", "idle", "run", IsTryingToMove)
.add_transition("t_idle", "run", "idle", IsStill)
.add_transition("t_jump", ["idle", "run"], "jump", CanJump)
.add_transition("t_jump", "fall", "jump", IsCoyoteLeft)
.add_transition("t_fall", ["idle", "run"], "fall")
.add_transition("t_fall", "jump", "fall", IsFalling)
.add_transition("t_land", ["jump", "fall"], "idle", IsStill)
.add_transition("t_land", ["jump", "fall"], "run", IsTryingToMoveOrMoving)

.on("state changed", function(_to, _from) {
	show_debug_message($"PLAYER: State chanced from \"{_from}\" to \"{_to}\".");
});
