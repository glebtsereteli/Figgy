cfg = CFG.Enemies.Baddie; // @Figgy: Store the Baddie config struct to use throughout the object.

// The movement speed of the enemy along its path.
//move_speed = cfg.MoveSpeed; // @Figgy: Using config.

// This will be true when the baddie is attacking the player, otherwise
// it will be false.
attacking = false;

// Starts following the path stored in the path_to_follow
// variable. This is created in the "Variable Definitions" menu.
// path_action_continue means that once it reaches the end of that
// path, it continues following it and doesn't stop.
path_start(path_to_follow, cfg.MoveSpeed, path_action_continue, true);
