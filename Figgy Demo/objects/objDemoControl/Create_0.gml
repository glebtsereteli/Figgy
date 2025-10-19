
#macro NoDelta:FIGGY_FILE_DELTA false
#macro CFG Figgy.GetCurrent()

window_set_caption($"{__FIGGY_NAME} {__FIGGY_VERSION} ({__FIGGY_DATE}) Demo!");
randomize();
show_debug_overlay(true, true);

show_message(json_stringify(CFG, true));
