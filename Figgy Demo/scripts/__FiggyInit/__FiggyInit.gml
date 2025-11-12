/// @feather ignore all

if (os_browser != browser_not_a_browser) {
	__FiggyError("HTML5 is not supported");
}
if (__FIGGY_ON_DESKTOP and GM_is_sandboxed) {
	__FiggyError($"{__FIGGY_NAME} can't operate with GameMaker's file system sandboxing enabled.\nPlease tick the \"Disable file system sandbox\" option for your target platform(s), and make sure to click Apply");
}
__FiggyLogFree($"Welcome to {__FIGGY_NAME} {__FIGGY_VERSION} ({__FIGGY_DATE}) by Gleb Tsereteli");

Figgy();
Figgy.__Init();
