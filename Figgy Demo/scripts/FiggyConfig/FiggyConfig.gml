// feather ignore all
// Documentation: https://glebtsereteli.github.io/Figgy/pages/api/config

#region General

// Whether to show debug messages in the Output window (true) or not (false).
#macro FIGGY_DEBUG true

// Whether to build the Figgy debug interface (true) or not (false).
// By default, this is enabled when running the game from IDE and disabled when running from EXE, using the __FIGGY_IN_IDE status macro.
#macro FIGGY_BUILD_INTERFACE __FIGGY_IN_IDE

#endregion
#region File

// The config file name.
#macro FIGGY_FILE_NAME "config"

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
// Set to true to make the config file unreadable to users.
#macro FIGGY_FILE_OBFUSCATE false

// Whether to remove spaces from variable names (true) or not (false), e.g. "Move Speed" in Setup becomes "MoveSpeed" in code.
// • Set to true if you use variable names with spaces, like "Move Speed", AND want to avoid using the struct accessor
// for accessing configs in code.
// • Leave as false if you use variable names like "move_speed" or "moveSpeed".
//
// WARNING: Changing this mid-game will erase existing saved configs, so make sure to decide on this early on.
#macro FIGGY_FILE_REMOVE_SPACES true

#endregion
#region Controls

// Name of the Controls section.
#macro FIGGY_CONTROLS_NAME "[CONTROLS]"

// Whether the Controls section starts open (true) or not (false).
#macro FIGGY_CONTROLS_OPEN true

// Whether to include the Controls section in every window (true) or not (false).
// If set to false, the Controls section will only be included in the first window.
#macro FIGGY_CONTROLS_IN_EVERY_WINDOW true

#endregion
#region Scope Widgets

// A. The name of the default window that's created if no .Window()s are used.
// B. The prefix used for custom .Window()s (e.g. "Figgy: Player").
#macro FIGGY_WINDOW_NAME "Figgy"

// Whether Figgy windows start visible by default (true) or not (false).
#macro FIGGY_WINDOW_DEFAULT_START_VISIBLE false

// Default X position of Figgy windows.
#macro FIGGY_WINDOW_DEFAULT_X 8

// Default Y position of Figgy windows.
#macro FIGGY_WINDOW_DEFAULT_Y 27

// Default width of Figgy windows.
#macro FIGGY_WINDOW_DEFAULT_WIDTH 400

// Default height of Figgy windows.
#macro FIGGY_WINDOW_DEFAULT_HEIGHT 600

// Whether .Section()s are open by default (true) or not (false).
#macro FIGGY_SECTION_DEFAULT_OPEN true

// Default .Group() and .Separator() text alignment. 0 is left, 1 is center, 2 is right.
#macro FIGGY_GROUP_DEFAULT_ALIGN 0

// The suffix added to NOT SCOPED Sections and Groups (when the "scoped" argument set to false).
// NOTE: You may want to set this to something descriptive (or just a symbol) for extra interface clarity.
#macro FIGGY_NOSCOPE_SUFFIX ""

#endregion
#region Value Widgets

// Default step increment for .Int() Value Widgets.
#macro FIGGY_INT_DEFAULT_STEP 1

// Default step increment for .Float() Value Widgets.
#macro FIGGY_FLOAT_DEFAULT_STEP 0.1

// Whether to include -/+ cycling buttons for .Multi() Value Widgets (true) or not (false).
#macro FIGGY_MULTI_BUTTONS true

#endregion
#region Decor Widgets

// Default .Separator() text alignment.
#macro FIGGY_SEPARATOR_DEFAULT_ALIGN 0

#endregion
#region Changes

// Whether to enable the Changes tracking system (true) or not (false).
// By default, this is enabled when running the game from IDE and disabled when running from EXE, using the __FIGGY_IN_IDE status macro.
// NOTE: Set this to false to improve performance at scale.
#macro FIGGY_CHANGES_ENABLED __FIGGY_IN_IDE

// The default function to call when a Value Widget value is changed. undefined stands for "no function".
// The arguments passed to the callback: (newValue, oldValue, variableName).
#macro FIGGY_CHANGES_DEFAULT_CALLBACK undefined

#endregion
