
function __figgyLogFree(_message) {
	show_debug_message($"{__FIGGY_LOG_PREFIX} {_message}.");
}
function __figgyLog(_message) {
	if (not FIGGY_DEBUG_LOG) return;
	__figgyLogFree(_message);
}
function __figgyLogTimed(_message) {
	if (not FIGGY_DEBUG_LOG) return;
	__figgyLog($"{_message}. Took {__FIGGY_BENCH_END} milliseconds");
}
function _figgyError(_message) {
	static _divider = string_repeat("=", 100);
	show_error($"\n\n{_divider}\n[{__FIGGY_NAME} {__FIGGY_VERSION}] ERROR.\n\n\n{_message}.\n{_divider}\n\n", true);
}
