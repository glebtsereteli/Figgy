
#region info

#macro __FIGGY_VERSION "v0.0.0" // major.minor.patch
#macro __FIGGY_DATE "2025.xx.xx" // year.month.day
#macro __FIGGY_NAME "Figgy"
#macro __FIGGY_LOG_PREFIX $"[{__FIGGY_NAME}]"

#endregion

#macro __FIGGY_PATH $"{filename_dir(GM_project_filename)}/datafiles/{FIGGY_FILE_NAME}{FIGGY_FILE_EXT}"
#macro __FIGGY_RAWNAME var _rawName = string_replace_all(_name, " ", "")

#macro FIGGY_SETUP_START Figgy.setup(function() {
#macro FIGGY_SETUP_END });
