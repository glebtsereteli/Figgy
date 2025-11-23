cfg = CFG.Player; // @Figgy: Store the Player config struct to use throughout the object.

// This variable is called move_speed and stores the movement speed of the
// player. The speed is in pixels-per-second.
move_speed = cfg.MoveSpeed; // @Figgy: Use config.
//default_move_speed = move_speed; // @Figgy: Using config.

// Initialize coins value at 0
coins = 0;

// Max hearts & "current" hearts
//max_hearts = 4; // @Figgy: Using config.
hearts = cfg.MaxHearts; // @Figgy: Use config.

// The direction that the player is facing in (0, 90, 180, 270)
input_direction = 0;

// Is a power up active?
powerup_active = false;

// Is the invincibility power up active?
star_powerup_active = false;

// Shield energy (out of 100)
shield_energy = cfg.Shield.MaxPower; // @Figgy: Use config.

// Set the audio listener's position to the player's position
audio_listener_position(x, y, 0);

// Use a linear distance falloff model
audio_falloff_set_model(audio_falloff_linear_distance);

// Change orientation to fix L/R audio
audio_listener_orientation(0, 0, -1000, 0, 1, 0);