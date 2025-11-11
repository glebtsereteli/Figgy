/// @desc Initialize demo

// General setup:
window_set_caption($"{__FIGGY_NAME} {__FIGGY_VERSION} ({__FIGGY_DATE}) Demo!");
randomize();
application_surface_draw_enable(false);
display_set_gui_size(display_get_width(), display_get_height());

draw_set_font(fntDemo);
font_enable_effects(fntDemo, true, {
	outlineEnable: true,
	outlineColor: #353541,
	outlineDistance: 2,
});

// Store our config struct in a global variable with a macro shortcut:
#macro CFG global.__config
CFG = Figgy.GetCurrent();

// Open the debug overview with hidden FPS:
var _view = dbg_view("dummy", false);
dbg_view_delete(_view);
