# Setup

Your Figgy workflow begins with the global `FiggySetup()` function, which acts as the library's main entry point. Inside it, you create your :Windows:, :Sections:, :Groups:, :Value: and :Decor: Widgets that shape both the visual debug interface and the underlying config data layout for your game.

Figgy's setup process is built around Widgets - modular building blocks that define what appears in your debug view and how it's reflected in your game's config data struct.

---

Setup is organized into the following categories:
* :Scope Widgets: define new scopes (structs) and organize nested widgets.
* :Value Widgets: represent editable data values such as numbers, strings, booleans, and colors. These correspond to in-game values like `moveSpeed` or `attackRange` that you'll be working with throughout your game's code.
* :Decor Widgets: provide visual or interactive elements such as comments, buttons, and separators that are not related to any data and are there to prettify the interface and allow for additional controls.
* :OnChange: allows you to assign callbacks for a set of :Value Widgets: that are triggered whenever you change your widgets' values.

::: danger IMPORTANT
Setup methods <u>must be declared</u> inside the `FiggySetup()` function within the `FiggySetup` script, and all examples on this page are assumed to be executed from within `FiggySetup()`.
:::

## Formatting

## Scope Widgets

Scope Widgets define new scopes (structs) and are used to organize other nested widgets.

* Visually, they serve as containers that organize other widgets within the DBG interface.
* Internally, they create new structs (unless explicitly marked as non-scoped), and all subsequent widgets are added within their scope.

---

There are 3 Scope Widgets, each defining a different *scope level*, from highest to lowest:
1. :.Window(): is the highest-level Scope Widget. It creates a :DBG View: with a struct in the Root scope and serves as a container for :Sections:, :Groups:, :Value Widgets:, and :Decor Widgets:.
2. :.Section(): comes second after :.Window(): and creates a :DBG Section: with a struct in the current (Root or Window) scope, unless optionally specified as non-scope. It serves as a container for :Groups:, :Value Widgets: and :Decor Widgets:.
3. :.Group(): is the The third and lowest scope level. It creates a new :DBG Text Separator: with a struct in the current (Root, Window, or Section) scope, unless optionally specified as non-scoped. It serves as a container for :Value Widgets: and :Decor Widgets:.

---
### `.Window()`

> `Figgy.Window(name, [visible?], [x], [y], [width], [height])` ➜ :Struct:.:Figgy:

Creates a struct at the Root scope, represented as a :DBG View:

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
    // Sections, Groups and Value Widgets here...

// Creates an "Enemy" window at the top-right corner of the game window, hidden by default.
var _width = 300;
var _xPad = 8;
var _x = window_get_width() - _width - _xPad;
Figgy.Window("Enemy", false, _x, FIGGY_WINDOW_DEFAULT_Y, _width); // [!code highlight]
    // Sections, Groups and Value Widgets here...
```
:::

---
### `.Section()`

> `Figgy.Section(name, [scoped?], [open?])` ➜ :Struct:.:Figgy:

If `scoped` (default), creates a struct at the current scope (Root or Window), represented as a :DBG Section:.
Once called, the previous non-Section scope (Root or Window) becomes inaccessible. All following Widgets will be created in the context of the current Section.

Call this method again to switch scope to another Section.

If not `scoped`, a struct is not created in the file and the scope does not change. In this case, the widget acts as a purely visual :DBG Section: with an optional suffix for interface clarity, configured via the :FIGGY_NOSCOPE_SUFFIX: config macro.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The section name |
| `[scoped?]` | :Bool: | Whether the section creates a new scope (`true`) or not (`false`) [Default: `true`]` |
| `[open]` | :Bool: | Whether the section starts open (`true`) or not (`false`) [Default: :FIGGY_SECTION_DEFAULT_OPEN:] |

::: code-group
```js [Example]
// Creates a scoped Skeleton Section inside the Enemies window:
Figgy.Window("Enemies");
    Figgy.Section("Skeleton"); // [!code highlight]
        // Groups and/or Value Widgets here...
```
:::

---
### `.Group()`

> `Figgy.Group(name, [scoped?], [align])` ➜ :Struct:.:Figgy:

If `scoped` (default), creates a struct at the current scope (Root, Window or Section), represented as a :DBG Text Separator:.
Once called, all following Value Widgets will be created in the context of the current Group.

If not `scoped`, acts as a purely visual :DBG Text Separator:.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The group name |
| `[scoped?]` | :Bool: | Whether the group creates a new scope (`true`) or not (`false`) [Default: `true`]` |
| `[align]` | :Enum:.:FIGGY_ALIGN: | Whether the group starts open (`true`) or not (`false`) [Default: :FIGGY_SECTION_DEFAULT_OPEN:] |

::: code-group
```js [Example]
// Creates Dash, Slam and Uppercut scoped groups inside the Player window,
// grouped under a non-scoped Abilities section:
Figgy.Window("Player");
    Figgy.Section("Abilities", false);
        Figgy.Group("Dash"); // [!code highlight]
            // Value Widgets here...
        Figgy.Group("Slam"); // [!code highlight]
            // Value Widgets here...
        Figgy.Group("Uppercut"); // [!code highlight]
            // Value Widgets here...
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
