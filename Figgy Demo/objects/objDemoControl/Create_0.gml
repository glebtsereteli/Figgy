
#macro CFG global.__config
CFG = Figgy.GetCurrent();

window_set_caption($"{__FIGGY_NAME} {__FIGGY_VERSION} ({__FIGGY_DATE}) Demo!");
randomize();
application_surface_draw_enable(false);
show_debug_overlay(true, true, 1, 1, false);
display_set_gui_size(BASE_W, BASE_H);

DemoRefreshDisplay();
