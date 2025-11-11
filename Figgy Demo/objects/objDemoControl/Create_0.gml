/// @desc Initialize demo

// Store our config struct in a global variable with a macro shortcut:
#macro CFG global.__config
CFG = Figgy.GetCurrent();

// Open the debug overview with hidden FPS:
var _view = dbg_view("dummy", false);
dbg_view_delete(_view);
