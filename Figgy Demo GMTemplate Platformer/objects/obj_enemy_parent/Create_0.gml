event_inherited();

cfg = CFG.Enemy; // @Figgy: Store config struct in a variable to reference throughout the object.

// This is the amount of damage the enemy does to the player.
//damage = 1; // @Figgy: Using config.

// This sets the movement speed for the enemies.
//move_speed = 2; @Figgy: Using config.

StartMoving = function() {
	// This applies either move_speed or negative move_speed to the enemy's X velocity. This way the enemy will
	// either move left or right (at random).
	vel_x = choose(-cfg.MoveSpeed, cfg.MoveSpeed);
};
StartMoving();

// This sets the friction to 0 so the enemy never comes to a stop.
//friction_power = 0; @Figgy: Using config.