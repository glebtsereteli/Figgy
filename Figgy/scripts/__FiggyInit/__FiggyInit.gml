/// @feather ignore all

if (GM_is_sandboxed) {
	_figgyError("Figgy can't operate with GameMaker's file system sandboxing enabled.\nPlease enable the \"Disable file system sandbox\" option for your target platform, and make sure to click Apply");
}
__figgyLogFree($"Welcome to {__FIGGY_NAME} {__FIGGY_VERSION} ({__FIGGY_DATE}) by Gleb Tsereteli");

Figgy();
Figgy.__init();
