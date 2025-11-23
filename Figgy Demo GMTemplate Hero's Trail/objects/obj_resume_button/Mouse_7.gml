event_inherited();

if (is_mouse_over_debug_overlay()) exit; // @Figgy: Debug overlay blocks mouse.

// Unpause the game
obj_manager.pause = false;

// Activate all instances
instance_activate_all();

// Destroy the pause menu sequence
layer_sequence_destroy(obj_manager.pause_seq);