// feather ignore all

function __FiggyLogFree(_message) {
	show_debug_message($"{__FIGGY_LOG_PREFIX} {_message}.");
}
function __FiggyLog(_message) {
	if (not FIGGY_DEBUG) return;
	
	__FiggyLogFree(_message);
}
function __FiggyLogTimed(_message) {
	if (not FIGGY_DEBUG) return;
	
	__FiggyLog($"{_message}. Took {__FIGGY_BENCH_END} milliseconds");
}
function __FiggyError(_message) {
	static _divider = string_repeat("=", 100);
	show_error($"\n\n{_divider}\n[{__FIGGY_NAME} {__FIGGY_VERSION}] ERROR.\n\n\n{_message}.\n{_divider}\n\n", true);
}

function __FiggySliderButtons() {
	dbg_same_line();
	dbg_button("-", function() {
		__scope[$ __name] = max(__scope[$ __name] - __step, __min);
	}, 19, 19);
	dbg_same_line();
	dbg_button("+", function() {
		__scope[$ __name] = min(__scope[$ __name] + __step, __max);
	}, 19, 19);
}
