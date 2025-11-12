// feather ignore all

#region Info

#macro __FIGGY_VERSION "v1.0.0" // major.minor.patch
#macro __FIGGY_DATE "2025.11.18" // year.month.day
#macro __FIGGY_NAME "Figgy"
#macro __FIGGY_LOG_PREFIX $"[{__FIGGY_NAME}]"

#endregion
#region Status

#macro __FIGGY_IN_IDE (GM_build_type == "run")
#macro __FIGGY_ON_DESKTOP ((os_type == os_windows) or (os_type == os_macosx) or (os_type == os_linux))
#macro __FIGGY_IO_ENABLED (__FIGGY_IN_IDE and __FIGGY_ON_DESKTOP)

#endregion
#region Utility

#macro __FIGGY_FILE_NAME $"{FIGGY_FILE_NAME}{FIGGY_FILE_EXT}"
#macro __FIGGY_FILE_PATH $"{__FIGGY_IN_IDE ? $"{filename_path(GM_project_filename)}datafiles/" : ""}{__FIGGY_FILE_NAME}"
#macro __FIGGY_FILE_FILTER $"Figgy Config File|*{FIGGY_FILE_EXT}"

#macro __FIGGY_NO_INIT \
if (__initInactive) { \
	__FiggyError($"{__FIGGY_NAME}.{_methodName}(): Setup methods must be called inside the global FiggySetup() function"); \
}

#macro __FIGGY_NO_INTERFACE if (not FIGGY_BUILD_INTERFACE) return self

#macro __FIGGY_RAWNAME \
var _rawName = _name; \
if (FIGGY_FILE_REMOVE_SPACES) { \
	_rawName = string_replace_all(_rawName, " ", ""); \
}

#macro __FIGGY_SCOPEDNAME string(FIGGY_UNSCOPED_NAME_FORMAT, _name)

#macro __FIGGY_CATCH_WINDOW \
if (not __windowed) { \
	__windowed = true; \
	if (FIGGY_BUILD_INTERFACE) { \
		dbg_view(FIGGY_WINDOW_NAME, FIGGY_WINDOW_DEFAULT_START_VISIBLE, FIGGY_WINDOW_DEFAULT_X, FIGGY_WINDOW_DEFAULT_Y, FIGGY_WINDOW_DEFAULT_WIDTH, FIGGY_WINDOW_DEFAULT_HEIGHT); \
		Figgy.__InitControls(); \
	} \
}

#macro __FIGGY_CATCH_FIRST_WINDOW_SECTION \
if (not __windowSectioned) { \
	__windowSectioned = true; \
	if (FIGGY_BUILD_INTERFACE) { \
		dbg_section(string(FIGGY_UNSCOPED_NAME_FORMAT, "Configs"), true); \
	} \
}

#macro __FIGGY_WIDGET \
__FIGGY_CATCH_WINDOW; \
__FIGGY_CATCH_FIRST_WINDOW_SECTION; \
__FIGGY_RAWNAME; \
__scope[$ _rawName] = _default; \
if (FIGGY_BUILD_INTERFACE) { \
	var _ref = ref_create(__scope, _rawName); \
} \
if (FIGGY_CHANGES_ENABLED and (_onChange != undefined)) { \
	__changes.__Add(__scope, _rawName, _onChange); \
}

#macro __FIGGY_SLIDER_BUTTONS \
if (FIGGY_SLIDER_BUTTONS) { \
	with ({}) { \
		__scope = other.__scope; \
		__name = _rawName; \
		__min = _min; \
		__max = _max; \
		__step = _step; \
		__FiggySliderButtons(); \
	} \
}

#macro __FIGGY_BENCH_START Figgy.__t = get_timer();
#macro __FIGGY_BENCH_END ((get_timer() - Figgy.__t) / 1000)

#endregion
