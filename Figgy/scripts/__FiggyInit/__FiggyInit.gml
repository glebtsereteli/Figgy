
if (GM_is_sandboxed) {
	_figgyError("Figgy can't run while GameMaker's file system sandbox is enabled.\nPlease enable the \"Disable file system sandbox\" option for your target platform, and make sure to click Apply");
}
__figgyLog($"Welcome to {__FIGGY_NAME} {__FIGGY_VERSION} ({__FIGGY_DATE}) by Gleb Tsereteli");
