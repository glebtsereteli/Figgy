
if (GM_is_sandboxed) {
	_figgyError($"Figgy can't operate with GameMaker being sandboxed.\nPlease enable the \"Disable file system sandbox\" option for your target platform.\nMake sure to hit Apply, then OK");
}
__figgyLog($"Welcome to {__FIGGY_NAME} {__FIGGY_VERSION} ({__FIGGY_DATE}) by Gleb Tsereteli");
