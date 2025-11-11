
#macro GUI_W display_get_gui_width()
#macro GUI_H display_get_gui_height()

function Approach(_a, _b, _step) {
    return (_a + clamp(_b - _a, -_step, _step));
}

function DemoRefreshDisplay() {
	#macro DISPLAY_MODE_WINDOWED "Windowed"
	#macro DISPLAY_MODE_EXCLUSIVE_FULLSCREEN "Exclusive Fullscreen"
	#macro DISPLAY_MODE_BORDERLESS_FULLSCREEN "Borderless Fullscreen"
	
	with (CFG.Display) {
		window_set_size(BASE_W * WindowScale, BASE_H * WindowScale);
		DemoRefreshAppsurf();
		
		window_enable_borderless_fullscreen(false);
		switch (Mode) {
			case DISPLAY_MODE_WINDOWED: {
				window_set_fullscreen(false);
				break;
			}
			case DISPLAY_MODE_EXCLUSIVE_FULLSCREEN: {
				window_set_fullscreen(true);
				break;
			}
			case DISPLAY_MODE_BORDERLESS_FULLSCREEN: {
				window_set_fullscreen(true);
				window_enable_borderless_fullscreen(true);
				break;
			}
		}
		
		window_center();
	}
}
function DemoRefreshAppsurf() {
	var _scale = CFG.Display.ResolutionScale;
	surface_resize(application_surface, BASE_W * _scale, BASE_H * _scale);
}
function DemoOnChange(_new, _old, _name) {
	show_debug_message($"Changed variable \"{_name}\" from {_old} to {_new}.");
}
