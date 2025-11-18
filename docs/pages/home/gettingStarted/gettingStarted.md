# Getting Started

This page walks you through installing and setting up Figgy configs in your GameMaker project for the first time.

:::tip
Throughout this page, and the documentation as a whole, you'll see many hyperlinks to key Figgy concepts. I encourage you to explore them briefly as you get started, as they'll help you quickly understand the library's overall structure.
:::

## Requirements

* [GameMaker](https://gamemaker.io/en/download) version `IDE v2024.14.0.207` and `Runtime v2024.14.0.251` or above.
* Basic familiarity with GameMaker and GML, including:
    * Asset types (rooms, objects, scripts, sprites, tilemaps, etc).
    * Working with objects and events.
    * Structs, functions/methods and arguments, macros.

## Installation

1. Download the `Figgy v1.0.0.yymps` package from the latest [Release](https://github.com/glebtsereteli/Figgy/releases/v1.0.0).
2. Import the package into your project.
    * Navigate to __Tools__ in the top toolbar and click __Import Local Package__, or just drag and drop the file into GameMaker.
    <!-- ![](import01.png) -->
    * Locate and select the `Figgy v1.0.0.yymps` local package in Explorer/Finder.
    * Click __Add All__.
    <!-- ![](import02.png) -->
    * Click __Import__.
    <!-- ![](import03.png) -->
    <!-- > The whole library lives inside the `Figgy` folder, and the only file under `Included Files` is the [MIT license](/pages/home/faq/#📍-how-is-figgy-licensed-can-i-use-it-in-commercial-projects). -->
3. You're good to go! Continue to the [Usage](#usage) section below to set up your first configs.

## Usage

### 1. Setting Up

Before you can use Figgy in your game, you need to define your configuration layout inside the global FiggySetup() function.

:Setup: is Figgy's central hub and entry point. It's where you create your :Scope Widgets:, :Value Widgets:, and :Decor Widgets: — everything that appears in the :Interface: and everything that becomes part of your config data struct.

In this simple example, we create a `Player` :Window: Scope Widget, which adds a new struct to the root scope of the config. Inside it, we define a single `Move Speed` :Float: Value Widget.

```js
function FiggySetup() {
    Figgy.Window("Player");
        Figgy.Float("Move Speed", 5, 1, 15);
}
```

### 2. Understanding Data

Now let's see how this setup is represented in the config struct that you'll be accessing throughout your game:
```js
{
    Player: {
        MoveSpeed: 5,
    },
}
```

You'll notice that our variable name `"Move Speed"` turned into `MoveSpeed` in the config. By default, Figgy removes spaces from variable names so you can access them easily without using the struct accessor with string keys, while keeping the interface label more readable.

### 2. Accessing Values

Now that our configs are defined in :Setup: and we understand how they appear in the config struct, let's actually use the `MoveSpeed` value in our player object.

You can access the current config struct with :.GetCurrent():, which works fine for small setups, but becomes tedious once your config grows into hundreds of values. Here's the access pattern I recommend for comfortable work at scale.

---

* Start by creating a global + macro pair for clean root access. Since the config struct reference never changes, you can store it in a global variable once and simply reuse it throughout the game.

    Do this wherever you handle your game's initialization, **after** scripts are initialized, and **before** you access any configs. Usually that happens in some master object's Create event, or the first room's Creation Code:
    ```js
    #macro CFG global.__config
    CFG = Figgy.GetCurrent();
    ```
* Then, in your player object's Create event, store a reference to the `Player` config so you can easily access any of its configs throughout the object:
:::code-group
```js [objPlayer's Create event]
cfg = CFG.Player;
```
:::
* With all that set up, we can finally use our config in `objPlayer`'s movement code. For example, here's you could use `MoveSpeed` for simple top-down movement and collision:
:::code-group
```js [objPlayer's Step event]
var _xInput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _yInput = keyboard_check(ord("S")) - keyboard_check(ord("W"));
if ((_xInput != 0) or (_yInput != 0)) {
    var _dir = point_direction(0, 0, _xInput, _yInput);
    var _xSpd = lengthdir_x(cfg.MoveSpeed, _dir); // [!code focus]
    var _ySpd = lengthdir_y(cfg.MoveSpeed, _dir); // [!code focus]
    move_and_collide(_xSpd, _ySpd, objWall);
}
```
:::

Now, this is all great, but where can we actually edit the config live while the game is running to see our changes reflected in the player movement?

### 3. Editing

If at least one of the :Windows: you defined in :Setup: is marked as `visible`, Figgy will automatically open the :Debug Interface: for you.

Otherwise, you can open it manually with `show_debug_overlay(true, true);`, or use this little trick to open the overlay without the FPS window:
```js
var _dummy = dbg_view("dummy", false);
dbg_view_delete(_dummy);
```

Once the overlay is open, go to the **Views** menu in the top bar. Under **Views**, select the **Figgy: Player** window to access your player configs. There, you'll see the :Group: had created a :DBG Section:, and the :Float: had created a `Move Speed` :DBG Slider:, which we can now adjust to change the player's movement speed in real time.

Under the Controls section at the top of the window, you can Save your changes 

## That's it! What's Next?

You've now seen how to get Figgy up and running in your GameMaker project — from installing the package, defining your first configs in :Setup:, understanding how they appear in the config struct, to accessing and using them in your objects.

By creating a global reference to your config and linking object-level shortcuts, you can comfortably scale Figgy to handle large and complex setups. And with the automaticically built :Interface:, you can tweak values live, instantly seeing the effects in your game.

Next up, check out... **COMING SOON!**
