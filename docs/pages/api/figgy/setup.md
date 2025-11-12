# Setup

## Overview

Figgy workflow begins in the global `FiggySetup()` function, which acts as the library's main entry point. Inside it, you create your :Windows:, :Sections:, :Groups:, :Value: and :Decor: Widgets that shape both the visual debug interface and the underlying config data layout for your game.

Figgy's setup process is built around Widgets - modular building blocks that define what appears in your debug view and how it's reflected in your game's config data struct.

---

Setup is organized into the following categories:
* :Scope Widgets: define new scopes (structs) and organize nested widgets.
* :Value Widgets: represent editable data values such as numbers, strings, booleans, and colors. These correspond to in-game values like `moveSpeed` or `attackRange` that you'll be working with throughout your game's code.
* :Decor Widgets: provide visual or interactive elements such as comments, buttons, and separators that are not related to any data and are there to prettify the interface and allow for additional controls.
* :OnChange: allows you to assign callbacks for a set of :Value Widgets: that are triggered whenever you change your widgets' values.

::: danger ❗ IMPORTANT
* All Setup methods must be called inside the `FiggySetup()` function located in the `FiggySetup` script. Calling them outside the function will throw an error.
* Figgy calls `FiggySetup()` internally during initialization. Do NOT remove, rename or call `FiggySetup()` manually! Doing so will break initialization.
:::
::: tip NAME FORMATTING
By default, Figgy removes all spaces when generating data entry names, e.g. `"Move Speed"` becomes `"MoveSpeed"` in code.

If you don't plan to use variable names with spaces in your interface, this can be disabled for performance gains by disabling the :FIGGY_FILE_REMOVE_SPACES: config macro.
:::

## Organization

Figgy uses a syntax-lite approach for setup code: you don't write curly braces or manual struct blocks. Scope is defined entirely by the order of your Widget calls - any indentation or extra formatting is optional and is used purely for organization and readability.

Below are some common approaches you can use to organize your setup code. All of them are purely organizational and don't affect Figgy's scoping system in any way.

* **No Extra Formatting**. All setup calls live directly inside `FiggySetup()` with no regions, helper functions, or grouping. This is fine for small projects or when you're just getting started, but can become harder to navigate as your configuration grows.
::: code-group
```js [Setup]
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

Creates a struct at the Root scope, represented as a :DBG View:.

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
```js [Setup]
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
{
    Player: {
        // Section/Group structs and Values here...
    },
    Enemy: {
        // Section/Group structs and Values here...
    },
}
```
```js [Access]
// In objPlayer's Create event, store the config struct for future use:
cfg = Figgy.GetCurrent().Player;

// In objEnemy's Create event, store the config struct for future use:
cfg = Figgy.GetCurrent().Enemy;
```
:::

---
### `.Section()`

> `Figgy.Section(name, [scoped?], [open?])` ➜ :Struct:.:Figgy:

Creates a struct at the current scope (Root or :Window:), represented as a :DBG Section:.

Once called, the previous non-Section scope (Root or :Window:) becomes inaccessible. All following Widgets will be created in the context of the current Section. Call this method again to switch scope to another Section.

::: tip
Call :.NoScope(): before :.Section(): to mark the upcoming Section as **unscoped**. This prevents a struct from being created, keeps the current scope unchanged, and makes the Section behave as a purely visual :DBG Section:.
:::

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The section name |
| `[open]` | :Bool: | Whether the section starts open (`true`) or not (`false`) [Default: :FIGGY_SECTION_DEFAULT_OPEN:] |

::: code-group
```js [Setup]
function FiggySetup() {
    // Creates a scoped Skeleton Section inside the Enemies window:
    Figgy.Window("Enemies");
        Figgy.Section("Skeleton"); // [!code highlight]
            // Groups and/or Value Widgets here...
}
```
```js [Data]
{
    Enemies: {
        Skeleton: {
            // Group structs and Values here...
        }
    },
}
```
```js [Access]
// In objEnemySkeleton's Create event, store the config struct for future use:
cfg = Figgy.GetCurrent().Enemies.Skeleton;
```
:::

---
### `.Group()`

> `Figgy.Group(name, [align])` ➜ :Struct:.:Figgy:

Creates a struct at the current scope (Root, Window or Section), represented as a :DBG Text Separator:.

Once called, all following Value Widgets will be created in the context of the current Group. All following Widgets will be created in the context of the current Group. Call this method again to switch scope to another Group.

::: tip
Call :.NoScope(): before :.Group(): to mark the upcoming Group as **unscoped**. This prevents a struct from being created, keeps the current scope unchanged, and makes the Group behave as a purely visual :DBG Text Separator:.
:::

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The group name |
| `[align]` | :Real: | The group name alignment. `0` is left, `1` is center, `2` is right [Default: FIGGY_GROUP_DEFAULT_ALIGN] |

::: code-group
```js [Setup]
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
```
```js [Access]
// In objPlayer's Create event, store the config struct for future use:
cfg = Figgy.GetCurrent().Player;

// Access relevant ability configs when needed:
var _dashCfg = cfg.Dash;
var _slamCfg = cfg.Slam;
var _uppercutCfg = cfg.Uppercut;
```
:::

---
### `.NoScope()`

> `Figgy.NoScope()` ➜ :Struct:.:Figgy:

Marks the next :.Section(): or :.Group(): call as **unscoped**, treating it as a purely visual interface element. This applies only to the immediately following :Section: or :Group: and resets automatically afterward.

> ℹ️ :Windows: can not be unscoped. 

::: code-group
```js [Setup]
function FiggySetup() {
    // Creates a unscoped Abilities section in the Player window:
    Figgy.Window("Player");
        Figgy.NoScope().Section("Abilities"); // [!code highlight]
            Figgy.Group("Dash");
                // Value Widgets here...
}
```
```js [Data]
{
    Player: {
        Dash: {
            // Values here...
        },
    },
}
```
```js [Access]
var _dashCfg = Figgy.GetCurrent().Player.Dash;
```
:::

## Value Widgets

Value Widgets represent editable data values - numbers, strings, booleans, and colors. These map directly to gameplay variables such as `moveSpeed` or `attackRange` that you'll reference throughout your code.

You can place Value Widgets anywhere within your setup. Their parent scope is determined by the most recently used :Scope Widget:. If no :Scope Widgets: have been called yet, Value Widgets are placed in the Root scope.

All Value Widgets start with a name, which is how you reference them in your code. They also support an optional `[onChange]` callback that lets you run custom logic whenever the value is modified.

---

Value Widgets include the following:
* :Ints: and :Floats: define :Int: and :Float: :Real: values. They are represented as :DBG Slider: and :DBG Float Slider: elements, with control over min-max ranges and step sizes.
* :Bools: define :Bool: values, and are represented as a :DBG Checkbox:.
* :Strings: define :String: values, and are represented as a :DBG Text Input:.
* :Colors: define :Color: values, and are represented as a :DBG Color:.
* :Any: widgets define values of any type. Represented as a :DBG Dropdown:, they let you pick from the given array of options displayed as the given array of option names.

---
### `.Int()`

> `Figgy.Int(name, default, min, max, [step], [onChange])` ➜ :Struct:.:Figgy:

Creates a Real value in the current scope (Root, :Window:, :Section: or :Group:), represented as a :DBG Slider:.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The variable name |
| `default` | :Real: | The default value |
| `min` | :Real: | The minimum slider value |
| `max` | :Real: | The maximum slider value |
| `[step]` | :Real: | The slider step [Default: :FIGGY_INT_DEFAULT_STEP:] |
| `[onChange]` | :Id.Function: | The function to call when the value is changed [Default: :.OnChangeSet(): callback if set, or :FIGGY_CHANGES_DEFAULT_CALLBACK:] |

::: code-group
```js [Setup]
function FiggySetup() {
    Figgy.Window("Player");
        // Creates a JumpSpeed value in the Player window:
        Figgy.Int("Jump Speed", 15, 10, 20); // [!code highlight]
    
    Figgy.Window("Camera");
        // Creates DeadzoneX and DeadzoneY values in the Camera window
        // with a step of 10, for easier editing in a wider 0-200 range:
        Figgy.Int("Deadzone X", 100, 0, 200, 10);
        Figgy.Int("Deadzone Y", 100, 0, 200, 10);

    Figgy.Window("Terrain");
        // Creates an Octaves value in the Terrain window,
        // and regenerate the terrain when the value is changed:
        Figgy.Int("Octaves", 6, 4, 10, 1, function(_octaves) { // [!code highlight]
            with (objTerrain) {
                Regenerate();
            }
        });
}
```
```js [Data]
{
    Player: {
        JumpSpeed: 15,
    },
    Camera: {
        DeadzoneX: 100,
        DeadzoneY: 100,
    },
    Terrain: {
        Octaves: 6
    },
}
```
```js [Access]
var _jumpSpeed = Figgy.GetCurrent().Player.JumpSpeed;
var _deadzoneX = Figgy.GetCurrent().Camera.DeadzoneX;
var _deadzoneY = Figgy.GetCurrent().Camera.DeadzoneY;
var _octaves = Figgy.GetCurrent().Terrain.Octaves;
```
:::

---
### `.Float()`

> `Figgy.Float(name, default, min, max, [step], [onChange])` ➜ :Struct:.:Figgy:

Creates a Real value in the current scope (Root, :Window:, :Section: or :Group:), represented as a :DBG Float Slider:.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The variable name |
| `default` | :Real: | The default value |
| `min` | :Real: | The minimum slider value |
| `max` | :Real: | The maximum slider value |
| `[step]` | :Real: | The slider step [Default: :FIGGY_FLOAT_DEFAULT_STEP:] |
| `[onChange]` | :Id.Function: | The function to call when the value is changed [Default: :.OnChangeSet(): callback if set, or :FIGGY_CHANGES_DEFAULT_CALLBACK:] |

::: code-group
```js [Setup]
function FiggySetup() {
    Figgy.Window("Player");
        Figgy.NoScope().Section("Movement");
			Figgy.NoScope().Group("Horizontal");
                // Creates a RunSpeed Float value in the Player window.
                // Movement Section and Horizontal Group are unscoped:
                Figgy.Float("Run Speed", 5, 0.1, 10); // [!code highlight]
        Figgy.Section("Light");
            // Creates an Intensity Float value in the scoped Light section:
			Figgy.Float("Intensity", 1, 0.1, 2); // [!code highlight]
    Figgy.Window("Display");
        // Creates a ResolutionScale Float value in the Display window with a
        // 0.5 step, and resizes application_surface when changed:
		Figgy.Float("Resolution Scale", 2, 0.5, 4, 0.5, RefreshAppSurf); // [!code highlight]
}
```
```js [Data]
{
    Player: {
        RunSpeed: 5,
        Light: {
            Intensity: 1
        },
    },
    Display: {
        ResolutionScale: 2,
    },
}
```
```js [Access]
// In objPlayer's Create event, store the config struct for future use:
cfg = Figgy.GetCurrent().Player;

// In objPlayer's Step event, use the RunSpeed config to move:
xSpd = xInput * cfg.RunSpeed;

// In objPlayer's Step event, use the Light.Intensity config to adjust the
// intensity of the player light:
light.intensity = cfg.Light.Intensity;

// In our application_surface refreshing function:
function RefreshAppSurf() {
    // Grab the resolution scale from the Display config:
    var _scale = Figgy.GetCurrent().Display.ResolutionScale;
    surface_resize(application_surface, BASE_WIDTH * _scale, BASE_HEIGHT * _scale);
}
```
:::

---
### `.Bool()`

> `Figgy.Bool(name, default, [onChange])` ➜ :Struct:.:Figgy:

Creates a :Bool: value in the current scope (Root, :Window:, :Section: or :Group:), represented as a :DBG Checkbox:.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The variable name |
| `default` | :Bool: | The default value |
 `[onChange]` | :Id.Function: | The function to call when the value is changed [Default: :.OnChangeSet(): callback if set, or :FIGGY_CHANGES_DEFAULT_CALLBACK:] |

::: code-group
```js [Setup]
function FiggySetup() {
    Figgy.Window("Lighting");
        // Creates an Enabled Bool values inside the Lighting window:
		Figgy.Bool("Enabled", true);
}
```
```js [Data]
{
    Lighting: {
        Enabled: true,
    },
}
```
```js [Access]
{
    // In objLightingManager's Create event, store the config struct for future use:
    cfg = Figgy.GetCurrent().Lighting;

    // In objLightingManager's Step Post Draw event, handle application_surface drawing:
    if (cfg.Enabled) {
        // Draw appsurf with lighting applied.
    }
    else {
        // Draw appsurf normally.
    }
}
```
:::

---
### `.String()`

> `Figgy.String(name, default, [onChange])` ➜ :Struct:.:Figgy:

Creates a :String: value in the current scope (Root, :Window:, :Section: or :Group:), represented as a :DBG Text Input:.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The variable name |
| `default` | :String: | The default value |
 `[onChange]` | :Id.Function: | The function to call when the value is changed [Default: :.OnChangeSet(): callback if set, or :FIGGY_CHANGES_DEFAULT_CALLBACK:] |

::: code-group
```js [Setup]
function FiggySetup() {
    // Adds a WelcomeMessage String value in the Root scope:
    Figgy.String("Welcome Message", "Hey {0}, welcome to GameName!");
}
```
```js [Data]
{
    WelcomeMessage: "Hey {0}, welcome to GameName!",
}
```
```js [Access]
{
    // Draw the welcome message on at the bottom center of the title screen:
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_text(GUI_W / 2, GUI_H - 4, Figgy.GetCurrent().WelcomeMessage);
}
```
:::

---
### `.Color()`

> `Figgy.Color(name, default, [onChange])` ➜ :Struct:.:Figgy:

Creates a :Constant.GMColor: value in the current scope (Root, :Window:, :Section: or :Group:), represented as a :DBG Color:.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The variable name |
| `default` | :Constant.Color: | The default value |
 `[onChange]` | :Id.Function: | The function to call when the value is changed [Default: :.OnChangeSet(): callback if set, or :FIGGY_CHANGES_DEFAULT_CALLBACK:] |

::: code-group
```js [Setup]
function FiggySetup() {
    Figgy.Window("Lighting");
        // Creates an AmbientColor Color value in the Lighting window:
        Figgy.Color("Ambient Color", #191919);
}
```
```js [Data]
{
    Lighting: {
        AmbientColor: 1644825,
    }
}
```
```js [Access]
// In objLightingManager's Create event, store the config struct for future use:
cfg = CFG.Lighting;

// In objLightingManager's Step event, update the ambient color:
renderer.ambientColor = cfg.AmbientColor;
```
:::

---
### `.Any()`

> `Figgy.Any(name, default, values, [names], [onChange])` ➜ :Struct:.:Figgy:

Creates a value of any type in the current scope (Root, :Window:, :Section: or :Group:), represented as a :DBG Dropdown:.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The variable name |
| `default` | `Any` | The default value |
| `values` | :Array: of `Any` | The array of option values |
| `[names]` | :Array: of :String: | The array of option names [Default: `values`] |
| `[onChange]` | :Id.Function: | The function to call when the value is changed [Default: :.OnChangeSet(): callback if set, or :FIGGY_CHANGES_DEFAULT_CALLBACK:] |

::: code-group
```js [Setup]
function FiggySetup() {
    Figgy.Window("Player");
        global.playerSkins = ["Green", "Pink", "Purple", "Yellow"];
        // Creates a Skin String value in the Player window and updates
        // objPlayer's sprite when the value is changed:
        Figgy.Any("Skin", global.playerSkins[0], global.playerSkins,, function() {
            with (objPlayer) {
                UpdateSprite();
            }
        });
}
```
```js [Data]
{
    Player: {
        Skin: "Green",
    },
}
```
```js [Access]
// In objPlayer's Create event, store the config struct for future use:
cfg = CFG.Player;

// In objPlayer's UpdateSprite method, changes sprite by updating sprite_index to a
// sprite based the current skin and state and resets image_index:
UpdateSprite = function() {
    sprite_index = sprites[$ cfg.Skin][$ fsm.get_current_state()];
	image_index = 0;
};
```
:::

## Decor Widgets

Decor Widgets like :Comments:, :Buttons: and :Separators: are purely visual and do not map to any underlying data. They exist to improve readability add structure, and provide optional interface controls.

---
### `.Button()`

> `Figgy.Button(name, callback, [width], [height], [sameLine?])` ➜ :Struct:.:Figgy:

Creates a button that triggers the given callback function when pressed, represented as a :DBG Button:.

| Parameter | Type | Description |
| --- | --- | --- |
| `name` | :String: | The button name |
| `callback` | :Id.Function: | The function to call when the button is pressed |
| `[width]` | :Real: | The button width [Default: automatic DBG default] |
| `[height]` | :Real: | The button height [Default: automatic DBG default] |
| `[sameLine?]` | :Bool: | Whether the button should be placed on the same line with the last widget (`true`) or not (`false`) [Default: :FIGGY_BUTTON_DEFAULT_SAME_LINE:] |

::: code-group
```js [Setup]
function FiggySetup() {
    Figgy.Window("World");
        Figgy.Float("Miniboss Chunk Chance", 0.1, 0, 1, 0.01);
        Figgy.Float("Treasure Chunk Chance", 0.05, 0, 1, 0.01);
        Figgy.Float("Tree Density", 0.1, 0, 1, 0.01);
        // Adds a Button widget that regenerates the world when pressed: 
        Figgy.Button("Regenerate", WorldRegenerate);
}
```
:::

---
### `.Comment()`

> `Figgy.Comment(string, [sameLine?])` ➜ :Struct:.:Figgy:

Creates a text comment, represented as a :DBG Text:.

| Parameter | Type | Description |
| --- | --- | --- |
| `string` | :String: | The string to display in the comment |
| `[sameLine?]` | :Bool: | Whether the comment should be on the same line with the last widget (`true`) or not (`false`) [Default: ] |

::: code-group
```js [Setup]
function FiggySetup() {
    Figgy.Window("World");
        Figgy.Float("Miniboss Chunk Chance", 0.1, 0, 1, 0.01);
        // Adds a Comment describing the Float value above:
        Figgy.Comment("The chance to spawn a Miniboss chunk, as a 0-1 percentage.");
}
```
:::

---
### `.Separator()`

> `Figgy.Separator([name], [align])` ➜ :Struct:.:Figgy:

Creates a horizontal line separator with an optional name, represented as a DBG Separator.

This is practically just an **unscoped** :Group: under a different name.

| Parameter | Type | Description |
| --- | --- | --- |
| `[name]` | :String: | The separator name [Default: no name] |
| `[align]` | :Real: | The separator name alignment. 0 is left, 1 is center, 2 is right. [Default: :FIGGY_SEPARATOR_DEFAULT_ALIGN:] |

::: code-group
```js [Setup]
function FiggySetup() {
    Figgy.Window("Player");
        // Creates a Separator with an optional name:
        Figgy.Separator("Horizontal Movement");
            Figgy.Float("Walk Speed", 2, 0.1, 20);
            Figgy.Float("Run Speed", 4, 0.1, 20);
            // Creates a Separator with no name:
            Figgy.Separator();
            Figgy.Float("Acceleration", 1, 0.1, 1);
            Figgy.Float("Friction", 0.5, 0.1, 20);
            
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
```js [Setup]
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
```js [Setup]
function FiggySetup() {

}
```
```js [Data]
{

}
```
:::
