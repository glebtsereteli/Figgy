
#region info

#macro __FIGGY_VERSION "v0.0.0" // major.minor.patch
#macro __FIGGY_DATE "2025.xx.xx" // year.month.day
#macro __FIGGY_NAME "Figgy"
#macro __FIGGY_LOG_PREFIX $"[{__FIGGY_NAME}]"

#endregion
#region utility

#macro __FIGGY_PATH $"{filename_dir(GM_project_filename)}/datafiles/{FIGGY_FILE_NAME}{FIGGY_FILE_EXT}"

#macro __FIGGY_RAWNAME var _rawName = string_replace_all(_name, " ", "")

#macro __FIGGY_CATCH_WINDOW \
if (not __setup.__windowed) { \
	__setup.__windowed = true; \
	dbg_view(FIGGY_WINDOW_NAME, FIGGY_WINDOW_START_VISIBLE, FIGGY_WINDOW_X, FIGGY_WINDOW_Y, FIGGY_WINDOW_WIDTH, FIGGY_WINDOW_HEIGHT); \
	Figgy.__initControls(); \
}

#macro __FIGGY_WIDGET \
__FIGGY_CATCH_WINDOW; \
__FIGGY_RAWNAME; \
__setup.__scope[$ _rawName] = _default; \
var _ref = ref_create(__setup.__scope, _rawName);

#macro __FIGGY_SECTION \
__setup.__section = {}; \
__setup.__scope[$ _name] = __setup.__section; \
__setup.__scope = __setup.__section;

#macro __FIGGY_BENCH_START Figgy.__t = get_timer();
#macro __FIGGY_BENCH_END ((get_timer() - Figgy.__t) / 1000)

#endregion
#region shortcuts

#macro FIGGY_SETUP_START Figgy(); Figgy.__init(function() {
#macro FIGGY_SETUP_END })

#endregion
