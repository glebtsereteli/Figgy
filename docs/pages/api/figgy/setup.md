# Setup

## Overview

Your Figgy workflow begins in the global `FiggySetup()` function, which acts as the library's main entry point. Inside it, you create your :Windows:, :Sections:, :Groups:, :Value: and :Decor: Widgets that shape both the visual debug interface and the underlying config data layout for your game.

Figgy's setup process is built around Widgets - modular building blocks that define what appears in your debug view and how it's reflected in your game's config data struct.

---

Setup is organized into the following categories:
* :Scope Widgets: define new scopes (structs) and organize nested widgets.
* :Value Widgets: represent editable data values such as numbers, strings, booleans, and colors. These correspond to in-game values like `moveSpeed` or `attackRange` that you'll be working with throughout your game's code.
* :Decor Widgets: provide visual or interactive elements such as comments, buttons, and separators that are not related to any data and are there to prettify the interface and allow for additional controls.
* :OnChange: allows you to assign callbacks for a set of :Value Widgets: that are triggered whenever you change your widgets' values.

::: danger IMPORTANT
Setup methods <u>must be declared</u> inside the `FiggySetup()` function located in the `FiggySetup` script. `FiggySetup()` **must not** be renamed or removed!
:::
::: tip NAME FORMATTING
By default, Figgy removes all spaces when generating data entry names, e.g. `"Move Speed"` becomes `"MoveSpeed"` in code.

If you don't plan to use variable names with spaces in your interface, this can be disabled for performance gains by disabling the :FIGGY_FILE_REMOVE_SPACES: config macro.
:::

## Organization

Figgy uses a syntax-lite approach for setup code: you don't write curly braces or manual struct blocks. Scope is defined entirely by the order of your Widget calls - any indentation or extra formatting is optional and is used purely for organization readability.

Below are some common organization approaches you can use to organize your setup code. All of them are purely organizational and don't affect Figgy's scoping system in any way.

* **No Extra Formatting**. All setup calls live directly inside `FiggySetup()` with no regions, helper functions, or grouping. This is fine for small projects or when you're just getting started, but can become harder to navigate as your configuration grows.
::: code-group
```js [Interface]
function FiggySetup() {
    Figgy.Window("Player");
        Figgy.NoScope().Section("Movement");
            Figgy.NoScope().Group("Horizontal");
                Figgy.Float("Walk Speed", 2, 0.1, 20);
                Figgy.Float("Run Speed", 4, 0.1, 20);
    Figgy.Window("Enemies");
        Figgy.Section("Slime");
            Figgy.Int("Health", 5, 1, 15);
            Figgy.Int("Damage", 1, 1, 10);
}
```
```js [Data]
{
    Player: {
        WalkSpeed: 4,
        RunSpeed: 2,
    },
    Enemies: {
        Slime: {
            Health: 3,
            Damage: 1,
        }
    },
}
```
:::
* **Regions**. You can use `#region` and `#endregion` or simple `{}` blocks to visually group related setup code. Both provide code folding, with curly brackets taking less space.
::: code-group
```js [#region Regions]
function FiggySetup() {
    #region Player

    Figgy.Window("Player");
        Figgy.NoScope().Section("Movement");
            Figgy.NoScope().Group("Horizontal");
                Figgy.Float("Walk Speed", 2, 0.1, 20);
                Figgy.Float("Run Speed", 4, 0.1, 20);

    #endregion
    #region Enemies

    Figgy.Window("Enemies");
        Figgy.Section("Slime");
            Figgy.Int("Health", 5, 1, 15);
            Figgy.Int("Damage", 1, 1, 10);

    #endregion
}
```
```js [Curly Brackets]
function FiggySetup() {
    Figgy.Window("Player"); {
        Figgy.NoScope().Section("Movement");
            Figgy.NoScope().Group("Horizontal");
                Figgy.Float("Walk Speed", 2, 0.1, 20);
                Figgy.Float("Run Speed", 4, 0.1, 20);
    }
    Figgy.Window("Enemies"); {
        Figgy.Section("Slime");
            Figgy.Int("Health", 5, 1, 15);
            Figgy.Int("Damage", 1, 1, 10);
    }
}
```
:::
* **Separate Setup Functions**. For larger projects, you can move each category of configs (such as Player, Enemies, Items, World, etc.) into their own global functions stored in separate scripts. Then simply call these functions inside `FiggySetup()`. This keeps `FiggySetup()` clean and makes each config section easier to maintain.

::: code-group
```js [FiggySetup]
function FiggySetup() {
    PlayerConfigs();
    EnemiesConfigs();
    // ...
}
```
```js [scrPlayerConfigs]
function PlayerConfigs() {
    Figgy.Window("Player");
        Figgy.NoScope().Section("Movement");
            Figgy.NoScope().Group("Horizontal");
                Figgy.Float("Walk Speed", 2, 0.1, 20);
                Figgy.Float("Run Speed", 4, 0.1, 20);
}
```
```js [scrEnemiesConfigs]
function EnemiesConfigs() {
    Figgy.Window("Enemies");
        Figgy.Section("Slime");
            Figgy.Int("Health", 5, 1, 15);
            Figgy.Int("Damage", 1, 1, 10);
}
```
:::

## Scope Widgets

Scope Widgets define new scopes (structs) and are used to organize other nested widgets.

* Visually, they serve as containers that organize other widgets within the DBG interface.
* Internally, they create new structs (unless explicitly marked as **unscoped** with :.NoScope():), and all subsequent widgets are added within their scope, until the scope is changed with another Scope Widget.

---

There are 3 Scope Widgets, each defining a different *scope level*, from highest to lowest:
1. :.Window(): is the highest-level Scope Widget. It creates a :DBG View: with a struct in the Root scope and serves as a container for :Sections:, :Groups:, :Value Widgets:, and :Decor Widgets:.
2. :.Section(): comes second after :.Window(): and creates a :DBG Section: with a struct in the current (Root or Window) scope, unless optionally specified as **unscoped**. It serves as a container for :Groups:, :Value Widgets: and :Decor Widgets:.
3. :.Group(): is the third and lowest scope level. It creates a new :DBG Text Separator: with a struct in the current (Root, Window, or Section) scope, unless optionally specified as **unscoped**. It serves as a container for :Value Widgets: and :Decor Widgets:.

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
```js [Interface]
function FiggySetup() {
    // Creates a Player window with default parameters:
    Figgy.Window("Player"); // [!code highlight]
        // Sections, Groups and Value Widgets here...

    // Creates an "Enemy" window at the top-right corner of the game window, hidden by default.
    var _width = 300;
    var _xPad = 8;
    var _x = window_get_width() - _width - _xPad;
    Figgy.Window("Enemy", false, _x, FIGGY_WINDOW_DEFAULT_Y, _width); // [!code highlight]
        // Sections, Groups and Value Widgets here...
}
```
```js [Data]
// Structure:
{
    Player: {
        // Section/Group structs, and Values here...
    },
    Enemy: {
        // Section/Group structs, and Values here...
    },
}

// Access Player configs:
cfg = Figgy.GetCurrent().Player;

// Access Enemy configs:
cfg = Figgy.GetCurrent().Enemy;
```
:::

---
### `.Section()`

> `Figgy.Section(name, [scoped?], [open?])` ➜ :Struct:.:Figgy:

Creates a struct at the current scope (Root or Window), represented as a :DBG Section:.
Once called, the previous non-Section scope (Root or Window) becomes inaccessible. All following Widgets will be created in the context of the current Section.

Call this method again to switch scope to another Section.

::: tip
Call :.NoScope(): before :.Section(): to mark the upcoming Section as **unscoped**. This prevents a struct from being created, keeps the current scope unchanged, and makes the Section behave as a purely visual :DBG Section:.
:::

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The section name |
| `[open]` | :Bool: | Whether the section starts open (`true`) or not (`false`) [Default: :FIGGY_SECTION_DEFAULT_OPEN:] |

::: code-group
```js [Interface]
function FiggySetup() {
    // Creates a scoped Skeleton Section inside the Enemies window:
    Figgy.Window("Enemies");
        Figgy.Section("Skeleton"); // [!code highlight]
            // Groups and/or Value Widgets here...
}
```
```js [Data]
// Structure:
{
    Enemies: {
        Skeleton: {
            // Group structs and Values here...
        }
    },
}

// Accessing Skeleton configs:
cfg = Figgy.GetCurrent().Enemies.Skeleton;
```
:::

---
### `.Group()`

> `Figgy.Group(name, [scoped?], [align])` ➜ :Struct:.:Figgy:

Creates a struct at the current scope (Root, Window or Section), represented as a :DBG Text Separator:.
Once called, all following Value Widgets will be created in the context of the current Group.

::: tip
Call :.NoScope(): before :.Group(): to mark the upcoming Group as **unscoped**. This prevents a struct from being created, keeps the current scope unchanged, and makes the Group behave as a purely visual :DBG Text Separator:.
:::

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The group name |
| `[scoped?]` | :Bool: | Whether the group creates a new scope (`true`) or not (`false`) [Default: `true`] |
| `[align]` | :Real: | Whether the group starts open (`true`) or not (`false`) [Default: :FIGGY_GROUP_DEFAULT_ALIGN:] |

::: code-group
```js [Interface]
function FiggySetup() {
    // Creates Dash, Slam and Uppercut scoped groups inside the Player window,
    // grouped under an unscoped Abilities section:
    Figgy.Window("Player");
        Figgy.NoScope().Section("Abilities");
            Figgy.Group("Dash"); // [!code highlight]
                // Value Widgets here...
            Figgy.Group("Slam"); // [!code highlight]
                // Value Widgets here...
            Figgy.Group("Uppercut"); // [!code highlight]
                // Value Widgets here...
}
```
```js [Data]
// Structure:
{
    Player: {
        Dash: {
            // Values here...
        },
        Slam: {
            // Values here...
        },
        Uppercut: {
            // Values here...
        },
    },
}

// Accessing ability configs:
cfg = Figgy.GetCurrent().Player;
dashCfg = cfg.Dash;
slamCfg = cfg.Dash;
uppercutCfg = cfg.Uppercut;
```
:::

---
### `.NoScope()`

> `Figgy.NoScope()` ➜ :Struct:.:Figgy:

Marks the next :.Section(): or :.Group(): call as **unscoped**, treating it as a purely visual interface element. This applies only to the immediately following :Section: or :Group: and resets automatically afterward.

> ℹ️ :Windows: can not be unscoped. 

::: code-group
```js [Interface]
function FiggySetup() {
    // Creates a unscoped Abilities section in the Player window:
    Figgy.Window("Player");
        Figgy.NoScope().Section("Abilities"); // [!code highlight]
            Figgy.Group("Dash");
                // Value Widgets here...
}
```
```js [Data]
// Structure:
{
    Player: {
        Dash: {
            // Values here...
        },
    },
}

// Access Dash configs:
dashCfg = Figgy.GetCurrent().Player.Dash;
```
:::

## Value Widgets

Overview...

---
### `.Int()`

> `Figgy.Int(name, default, min, max, [step], [onChange])` ➜ :Struct:.:Figgy:

Description...

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::

---
### `.Float()`

> `Figgy.Float(name, default, min, max, [step], [onChange])` ➜ :Struct:.:Figgy:

Description...

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::

---
### `.Bool()`

> `Figgy.Bool(name, default, [onChange])` ➜ :Struct:.:Figgy:

Description...

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::

---
### `.Text()`

> `Figgy.Text(name, default, [onChange])` ➜ :Struct:.:Figgy:

Description...

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::

---
### `.Color()`

> `Figgy.Color(name, default, [onChange])` ➜ :Struct:.:Figgy:

Description...

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::

---
### `.Multi()`

> `Figgy.Multi(name, default, values, names, [onChange])` ➜ :Struct:.:Figgy:

Description...

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::

## Decor Widgets

---
### `.Button()`

> `Figgy.Button(name, callback, [width], [height], [sameLine?])` ➜ :Struct:.:Figgy:

Description...

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::

---
### `.Comment()`

> `Figgy.Button(string, [sameLine?])` ➜ :Struct:.:Figgy:

Description...

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::

---
### `.Separator()`

> `Figgy.Separator([name], [align])` ➜ :Struct:.:Figgy:

Description...

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::


## OnChange



---
### `.OnChangeSet()`

> `Figgy.OnChangeSet(callback)` ➜ :Struct:.:Figgy:

Description

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :Type: | Description |
| `name` | :Type: | Description |
| `name` | :Type: | Description |

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::

---
### `.OnChangeReset()`

> `Figgy.OnChangeReset()` ➜ :Struct:.:Figgy:

::: code-group
```js [Interface]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::
