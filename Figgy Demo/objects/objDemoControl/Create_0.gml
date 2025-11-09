
// General demo setup:
window_set_caption($"{__FIGGY_NAME} {__FIGGY_VERSION} ({__FIGGY_DATE}) Demo!");
randomize();
application_surface_draw_enable(false);
display_set_gui_size(BASE_W, BASE_H);

// Store our config struct in a global variable with a macro shortcut:
#macro CFG global.__config
CFG = Figgy.GetCurrent();

// Open the debug overview with hidden FPS:
var _view = dbg_view("dummy", false);
dbg_view_delete(_view);
