
function __figgyLog(_message) {
	if (not FIGGY_DEBUG) return;
	show_debug_message($"{__FIGGY_LOG_PREFIX} {_message}.");
}
