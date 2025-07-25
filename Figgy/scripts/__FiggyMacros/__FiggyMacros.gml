/// @feather ignore all

#region info

#macro __FIGGY_VERSION "v1.0.0" // major.minor.patch
#macro __FIGGY_DATE "2025.xx.xx" // year.month.day
#macro __FIGGY_NAME "Figgy"
#macro __FIGGY_LOG_PREFIX $"[{__FIGGY_NAME}]"

#endregion
#region utility

#macro __FIGGY_FILE_NAME $"{FIGGY_FILE_NAME}{FIGGY_FILE_EXT}"
#macro __FIGGY_FILE_PATH $"{FIGGY_IN_IDE ? ($"{filename_dir(GM_project_filename)}/datafiles/") : ""}{__FIGGY_FILE_NAME}"
#macro __FIGGY_FILE_FILTER $"Figgy Config File|*{FIGGY_FILE_EXT}"

#macro __FIGGY_RAWNAME var _rawName = string_replace_all(_name, " ", "")

#macro __FIGGY_SECTION \
__scope = __rootScope; \
__section = {}; \
__scope[$ _name] = __section; \
__scope = __section;

#macro __FIGGY_CATCH_WINDOW \
if (not __windowed) { \
	__windowed = true; \
	dbg_view(FIGGY_WINDOW_DEFAULT_NAME, FIGGY_WINDOW_DEFAULT_START_VISIBLE, FIGGY_WINDOW_DEFAULT_X, FIGGY_WINDOW_DEFAULT_Y, FIGGY_WINDOW_DEFAULT_WIDTH, FIGGY_WINDOW_DEFAULT_HEIGHT); \
	Figgy.__InitControls(); \
}

#macro __FIGGY_WIDGET \
__FIGGY_CATCH_WINDOW; \
if (not __windowSectioned) { \
	__windowSectioned = true; \
	dbg_section("Configs", true); \
} \
__FIGGY_RAWNAME; \
__scope[$ _rawName] = _default; \
var _ref = ref_create(__scope, _rawName); \
if ((FIGGY_CHANGES_ENABLED) and (_onChange != undefined)) { \
	__changes.__Add(__scope, _rawName, _onChange); \
}

#macro __FIGGY_BENCH_START Figgy.__t = get_timer();
#macro __FIGGY_BENCH_END ((get_timer() - Figgy.__t) / 1000)

#endregion
#region public

#macro FIGGY_IN_IDE (GM_build_type == "run")

#endregion
