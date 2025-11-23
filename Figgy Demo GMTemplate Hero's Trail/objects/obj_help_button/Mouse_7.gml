event_inherited();

if (is_mouse_over_debug_overlay()) exit; // @Figgy: Debug overlay blocks mouse.

// This creates the help pop-up Sequence on the "GUI" layer
// The ID of the Sequence is then stored in a global variable
global.help_popup = layer_sequence_create("GUI", 0, 0, seq_help_window);

// (Applies to obj_button_parent)
// Moves all buttons 1000 pixels down so they're not visible and usable
with (obj_button_parent) {
	x += 0;
	y += 1000;
}