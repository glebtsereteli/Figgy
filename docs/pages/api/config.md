# Configuration

This page covers Figgy configuration macros.

## General

### `FIGGY_DEBUG`
> Default: `true`.

Whether to show debug messages in the Output window (`true`) or not (`false`).

### `FIGGY_BUILD_INTERFACE`
> Default: `__FIGGY_IN_IDE` (when running from IDE).

Whether to build the Figgy debug interface (`true`) or not (`false`).
By default, this is enabled when running the game from IDE and disabled when running from EXE, using the `__FIGGY_IN_IDE` status macro.

## File

### `FIGGY_FILE_NAME`
> Default: `"config"`.

The config file name.

---
### `FIGGY_FILE_EXT`
> Default: `".figgy"`.

The config file extension.

---
### `FIGGY_FILE_DELTA`
> Default: `true`.

Delta input/output mode.
When enabled (`true`), only variables that differ from their default values are saved.
When disabled (`false`), all variables are saved regardless of whether they match defaults.
Useful for inspecting or exporting the full config state.

::: tip warning
Setting this to `false` may reduce input/output performance at scale.
:::

---
### `FIGGY_FILE_PRETTIFY`
> Default: `true`.

Whether to format the config file for readability by prettifying the output JSON (`true`) or keep it compact (`false`).

---
### `FIGGY_FILE_OBFUSCATE`
> Default: `false`.

Whether to obfuscate (base64 encode and compress) the config file (`true`) or not (`false`).
Set to `true` to make the config file unreadable to users.

---
### `FIGGY_FILE_REMOVE_SPACES`
> Default: `false`.

Whether to remove spaces from variable names (`true`) or not (`false`), e.g. `"Move Speed"` in :Setup: becomes `"MoveSpeed"` in code.

* Set to `true` if you use variable names like `"Move Speed"` AND want to avoid using the struct accessor for accessing configs in code.
* Leave as `false` if you use variable names like `"move_speed"` or `"moveSpeed"`.

::: warning
Changing this mid-game will erase existing saved configs, so make sure to decide on this early on.
:::

## Controls

---
### `FIGGY_CONTROLS_NAME`
> Default: `"[CONTROLS]"`.

Name of the Controls section.

---
### `FIGGY_CONTROLS_OPEN`
> Default: `true`.

Whether the Controls section starts open (`true`) or not (`false`).

---
### `FIGGY_CONTROLS_IN_EVERY_WINDOW`
> Default: `true`.

Whether to include the Controls section in every window (`true`) or not (`false`). If set to false, the Controls section will only be included in the first window.

## Scope Widgets

### `FIGGY_WINDOW_NAME`
> Default: `"Figgy"`.

* The name of the default window that's created if no :.Window(): calls are made.
* The prefix used for custom :Windows: (e.g. `"Figgy: Player"`).

---
### `FIGGY_WINDOW_DEFAULT_START_VISIBLE`
> Default: `false`.

Whether Figgy :Windows: start visible by default (`true`) or not (`false`).

---
### `FIGGY_WINDOW_DEFAULT_X`
> Default: `8`.

Default X position of Figgy :Windows:.

---
### `FIGGY_WINDOW_DEFAULT_Y`
> Default: `27`.

Default Y position of Figgy :Windows:.

---
### `FIGGY_WINDOW_DEFAULT_WIDTH`
> Default: `400`.

Default width of Figgy :Windows:.

---
### `FIGGY_WINDOW_DEFAULT_HEIGHT`
> Default: `600`.

Default height of Figgy :Windows:.

---
### `FIGGY_SECTION_DEFAULT_OPEN`
> Default: `true`.

Whether :Sections: are open by default (`true`) or not (`false`).

---
### `FIGGY_GROUP_DEFAULT_ALIGN`
> Default: `0`.

Default :Group: text alignment. `0` is left, `1` is center, `2` is right.

---
### `FIGGY_NOSCOPE_SUFFIX`
> Default: `""` (empty string).

The suffix added to **non-scoped** :Sections: and :Groups: (when the `scoped` argument is set to `false`).

::: tip
You may want to set this to something descriptive (or just a symbol) for extra interface clarity.
:::

## Value Widgets

### `FIGGY_INT_DEFAULT_STEP`
> Default: `1`.

Default step increment for :Int: Value Widgets.

---
### `FIGGY_FLOAT_DEFAULT_STEP`
> Default: `0.1`.

Default step increment for :Float: Value Widgets.

---
### `FIGGY_MULTI_BUTTONS`
> Default: `true`.

Whether to include -/+ cycling buttons for :Multi: Value Widgets (`true`) or not (`false`).

## Decor Widgets

### `FIGGY_SEPARATOR_DEFAULT_ALIGN`
> Default: `0`.

Default :Separator: text alignment. 0 is left, 1 is center, 2 is right.

## Changes

### `FIGGY_CHANGES_ENABLED`
> Default: `__FIGGY_IN_IDE` (when running from IDE).

Whether to enable the Changes tracking system (`true`) or not (`false`).

By default, this is enabled when running the game from IDE and disabled when running from EXE, using the `__FIGGY_IN_IDE` status macro.

---
### `FIGGY_CHANGES_DEFAULT_CALLBACK`
> Default: `undefined`.

The default function to call when a Value Widgets' values are changed. `undefined` stands for "no function".

Arguments passed to the callback: `(newValue, oldValue, variableName)`.
