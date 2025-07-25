/// @feather ignore all

// Whether to show debug messages in the Output (true) or not (false).
#macro FIGGY_DEBUG true

#region FILE

// The config file name.
#macro FIGGY_FILE_NAME "Config"

// The config file extension.
#macro FIGGY_FILE_EXT ".figgy"

// Delta input/output mode.
// When enabled (true), only variables that differ from their default values are saved.
// When disabled (false), all variables are saved regardless of whether they match defaults.
// Useful for inspecting or exporting the full config state.
// NOTE: setting this to false may reduce input/output performance at scale.
#macro FIGGY_FILE_DELTA true

// Whether to format the config file for readability by prettifying the output JSON (true) or keep it compact (false).
#macro FIGGY_FILE_PRETTIFY true

// Whether to obfuscate (base64 encode and compress) the config file (true) or not (false).
// Set to true to make the config file unreadable to players (if they were to look into game files).
#macro FIGGY_FILE_OBFUSCATE false

#endregion
#region WIDGETS

// Default name for the Figgy window.
#macro FIGGY_WINDOW_DEFAULT_NAME "Figgy"

// Whether the Figgy window starts visible by default (true) or not (false).
// Enabled by default when running from the IDE.
#macro FIGGY_WINDOW_DEFAULT_START_VISIBLE __FIGGY_IN_IDE

// Default X position of the Figgy window.
#macro FIGGY_WINDOW_DEFAULT_X 8

// Default Y position of the Figgy window.
#macro FIGGY_WINDOW_DEFAULT_Y 27

// Default width of the Figgy window.
#macro FIGGY_WINDOW_DEFAULT_WIDTH 400

// Default height of the Figgy window.
#macro FIGGY_WINDOW_DEFAULT_HEIGHT 600

// Name of the controls section.
#macro FIGGY_CONTROLS_NAME "[CONTROLS]"

// Whether the controls section is open by default (true) or not (false).
#macro FIGGY_CONTROLS_OPEN true

// Whether .section()s are open by default (true) or not (false).
#macro FIGGY_SECTION_DEFAULT_OPEN true

// Defaul .group() name prefix.
#macro FIGGY_GROUP_DEFAULT_NAME_PREFIX ""

// Default .group() text alignment.
#macro FIGGY_GROUP_DEFAULT_ALIGN FIGGY_ALIGN.CENTER

// Default step increment for .int() values.
#macro FIGGY_INT_DEFAULT_STEP 1

// Default step increment for .float() values.
#macro FIGGY_FLOAT_DEFAULT_STEP 0.1

// Default .separator() text alignment.
#macro FIGGY_SEPARATOR_DEFAULT_ALIGN FIGGY_ALIGN.CENTER

// The default function to call when a Value Widget value is changed. undefined stands for "no function".
#macro FIGGY_DEFAULT_ON_CHANGE undefined

#endregion
