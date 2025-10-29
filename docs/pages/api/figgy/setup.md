# Setup

TODO overview

::: danger IMPORTANT
All following methods **must be** called inside the provided `FiggySetup()` global function located in the `FiggySetup` script.
:::

## Formatting Tips

TODO tips

## Scope Widgets

TODO description

---
### `.Window()`

> `Figgy.Window(name, [visible?], [x], [y], [width], [height])` ➜ :Struct:.:Figgy:

Creates a struct at the Root scope, represented as a [DBG View](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_view.htm).

Once called, the Root scope becomes inaccessible. All following Widgets will be created in the context of the current Window. Call this method again to switch scope to another Window.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The window name |
| `[visible?]` | :Bool: | Whether the window should start visible (`true`) or not (`false`) [Default: :FIGGY_WINDOW_DEFAULT_START_VISIBLE:] |
| `[x]` | :Real: | The x position of the window [Default: :FIGGY_WINDOW_DEFAULT_X:] |
| `[y]` | :Real: | The y position of the window [Default: :FIGGY_WINDOW_DEFAULT_Y:] |
| `[width]` | :Real: | The width of the window [Default: :FIGGY_WINDOW_DEFAULT_WIDTH:] |
| `[height]` | :Real: | The height of the window [Default: :FIGGY_WINDOW_DEFAULT_HEIGHT:] |

::: code-group
```js [Example]
// Creates a Player window with default parameters:
Figgy.Window("Player"); // [!code highlight]
    // Widgets here...

// Creates an "Enemy" window at the top-right corner of the game window, hidden by default.
var _width = 300;
var _xPad = 8;
var _x = window_get_width() - _width - _xPad;
Figgy.Window("Enemy", false, _x, FIGGY_WINDOW_DEFAULT_Y, _width); // [!code highlight]
    // Widgets here...
```
:::

---
### `.Section()`

> `Figgy.Section(name, [scoped?], [open?])` ➜ :Struct:.:Figgy:

If `scoped` (default), creates a struct at the current scope (Root or Window), represented as a [DBG Section](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_section.htm).
Once called, the previous non-Section scope (Root or Window) becomes inaccessible. All following Widgets will be created in the context of the current Section.

Call this method again to switch scope to another Section.

If not `scoped`, acts as a purely visual [DBG Section](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_section.htm) with an optional suffix for interface clarity, configured via the :FIGGY_NOSCOPE_SUFFIX: config macro.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The section name |
| `[scoped?]` | :Bool: | Whether the section creates a new scope (`true`) or not (`false`) [Default: `true`]` |
| `[open]` | :Bool: | Whether the section starts open (`true`) or not (`false`) [Default: :FIGGY_SECTION_DEFAULT_OPEN:] |

::: code-group
```js [Example]
TODO
```
:::

---
### `.Group()`

> `Figgy.Group(name, [scoped?], [align])` ➜ :Struct:.:Figgy:

If `scoped` (default), creates a struct at the current scope (Root, Window or Section), represented as a [DBG Text Separator](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_text_separator.htm).
Once called, all following Value Widgets will be created in the context of the current Group.

If not `scoped`, acts as a purely visual [DBG Text Separator](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_text_separator.htm).

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The group name |
| `[scoped?]` | :Bool: | Whether the group creates a new scope (`true`) or not (`false`) [Default: `true`]` |
| `[align]` | :Enum:.:FIGGY_ALIGN: | Whether the group starts open (`true`) or not (`false`) [Default: :FIGGY_SECTION_DEFAULT_OPEN:] |

::: code-group
```js [Example]
TODO
```
:::

## Value Widgets

Overview...

---
### `.Int()`

> `Figgy.Int(name, default, min, max, [step], [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

---
### `.Float()`

> `Figgy.Float(name, default, min, max, [step], [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

---
### `.Bool()`

> `Figgy.Bool(name, default, [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

---
### `.Text()`

> `Figgy.Text(name, default, [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

---
### `.Color()`

> `Figgy.Color(name, default, [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

---
### `.Multi()`

> `Figgy.Multi(name, default, values, names, [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

## Decor Widgets

---
### `.Button()`

---
### `.Comment()`

---
### `.Separator()`

## OnChange



---
### `.OnChangeSet()`

> `Figgy.OnChangeSet(callback)` ➜ :Struct:.:Figgy:

Description
Description
Description

|Parameter|Type|Description|
|---|---|---|
| `name` | Type | description |

::: code-group
```js [Example]
Figgy.Window("player");
    // Widgets here...
```
:::

---
### `.OnChangeReset()`
