
/// @func initialize_game()
/// @desc @Figgy: Game initialization helper function. Called in the Creation Code of rm_init.
function initialize_game() {
	randomize();
	
	// @Figgy: Set up a global reference to the config + a macro shortcut for convenient access.
	#macro CFG global.__config
	CFG = Figgy.GetCurrent();
	
	weapon_shooting_reset(); // @Figgy: Moved from 'weapon_shooting' script to initialize after configs.
	weapon_swipe_reset(); // @Figgy: Moved from the 'weapon_swipe' script to initialize after configs.
	weapon_trail_reset(); // @Figgy: Moved from 'weapon_trail' script to initialize after configs.
	
	// @Figgy: Create debug manager for toggling the Debug Overlay.
	instance_create_depth(0, 0, 0, obj_debug_manager);
	
	// Start the game.
	room_goto(rm_menu);
}
