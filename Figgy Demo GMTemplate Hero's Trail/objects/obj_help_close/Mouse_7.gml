event_inherited();

if (is_mouse_over_debug_overlay()) exit; // @Figgy: Debug overlay blocks mouse.

// This destroys the help pop-up Sequence
layer_sequence_destroy(global.help_popup);

// (Applies to obj_button_parent)
// This moves the buttons up by a 1000 pixels
with (obj_button_parent) {
	x += 0;
	y -= 1000;
}