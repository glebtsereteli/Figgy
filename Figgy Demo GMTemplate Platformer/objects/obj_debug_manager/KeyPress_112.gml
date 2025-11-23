/// @desc @Figgy: toggle debug overlay.

if (is_debug_overlay_open()) {
	show_debug_overlay(false);
}
else {
	// Open the debug overlay without the FPS window.
	dbg_view_delete(dbg_view("dummy", false));
}
