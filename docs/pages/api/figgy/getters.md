# Getters

## Overview

Once your configs are set up in Setup, you need a way to fetch values in your game code. Figgy provides getters for all three sets of config structs: [Current](#getcurrent), [Initial](#getinitial), and [Default](#getdefault).
* :.GetCurrent(): returns the current config struct that you edit through the :Interface: and fetch values from throughout your game code.
* :.GetInitial(): returns the initial config struct, captured after defaults are initialized in :Setup: and saved changes (if any) are loaded at game startup.
* :.GetDefault(): returns the default config struct that holds the original baseline values defined in :Setup:.

## Getters

### `.GetCurrent()`

> `Figgy.GetCurrent()` ➜ :Struct:

Returns the current config struct that you edit through the :Interface: and fetch values from throughout your game code.

::: tip
I recommend storing the current config struct in a convenient global + macro pair for cleaner access instead of having to call `Figgy.GetCurrent()` every time you need to fetch a config value.

You'll need to do it at the start of your game where you perform initialization. Make sure it's done **after** scripts are initialized (in some master object's Create event, or the first room's Creation Code) and **before** you need to access your first configs.
:::code-group
```js [Example]
// Set up global + macro:
#macro CFG global.__config // [!code highlight]
CFG = Figgy.GetCurrent(); // [!code highlight]

// In objPlayer's Create event, store the config struct for future use:
cfg = CFG.Player; // [!code highlight]

// In objPlayer's MoveX() method, grab the MoveSpeed variable from the config struct:
MoveX = function() {
    xSpd = InputX(INPUT_CLUSTER.MOVEMENT) * cfg.MoveSpeed; // [!code highlight]
};
```
:::

:::code-group
```js [Setup] 
function FiggySetup() {
    Figgy.Window("Player");
        // Sections, Groups and Value Widgets here...
    Figgy.Window("Enemies");
        Figgy.Section("Skeleton");
            // Value Widgets here...
}
```
```js [Data] 
{
    Player: { // [!code highlight]
       // Section/Group structs and Value Widget values here...
    },
    Enemy: { // [!code highlight]
        Skeleton: {
            // Group structs and Value Widget values here...
        },
    },
}
```
```js [Access] 
// In objPlayer's Create event, store the config struct for future use:
cfg = Figgy.GetCurrent().Player; // Without global + macro. [!code highlight]
cfg = CFG.Player; // With global + macro. [!code highlight]

// In objEnemySkeleton's Create event, store the config struct for future use:
cfg = Figgy.GetCurrent().Enemies.Skeleton; // Without global + macro. [!code highlight]
cfg = CFG.Player; // With global + macro. [!code highlight]
```
:::

---
### `.GetInitial()`

> `Figgy.GetInitial()` ➜ :Struct:

Returns the initial config struct, captured after defaults are initialized in :Setup: and saved changes (if any) are loaded at game startup.

The method is primarily intended for resetting the current config back to its initial state using the :Interface: or the :.ResetToInitial(): method, but feel free use it for any other purpose.

:::code-group
```js [Example]
var _initialConfig = Figgy.GetInitial(); // [!code highlight]
```
:::

---
### `.GetDefault()`

> `Figgy.GetDefault()` ➜ :Struct:

Returns the default config struct that holds the original baseline values defined in :Setup:.

The method is primarily intended for resetting the current config back to its default state using the :Interface: or the :.ResetToDefault(): method, but feel free use it for any other purpose.

:::code-group
```js [Example]
var _defaultConfig = Figgy.GetDefault(); // [!code highlight]
```
:::
