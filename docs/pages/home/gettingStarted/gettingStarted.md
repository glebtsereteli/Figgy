# Getting Started

This page walks you through installing and setting up Figgy configs in your GameMaker project for the first time.

We'll begin by importing the `.yymps` package. Then in the [Usage](#usage) section, we'll go through core library operations with [Setup](#_1-setup), [Acess](#_2-access), and [Editing](#_3-editing). By the end, TODO

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
    ![](import01.png)
    * Locate and select the `Figgy v1.0.0.yymps` local package in Explorer/Finder.
    * Click __Add All__.
    ![](import02.png)
    * Click __Import__.
    ![](import03.png)
        > The whole library lives inside the `Figgy` folder, and the only file under `Included Files` is the [MIT license](/pages/home/faq/#📍-how-is-figgy-licensed-can-i-use-it-in-commercial-projects). TODO
3. You're good to go! Next, check out the [Usage](#first-setup) section below to set up your first configs.

## Usage

### 1. Setup




Open the `FiggySetup` script, you'll see a `FiggySetup()` function

### 2. Access

With our configs now established in :Setup:, let's make use of them in our player object

in this example we have a very simple 

I recommend making a global + macro pair for cleaner root config access. The config struct reference never changes no matter what, so we can safely store our current config in a global variable once and reference it throughout the game.

```js
#macro CFG global.__config
CFG = Figgy.GetCurrent();
```


### 3. Editing

ok cool, now we've initialized our configs in :Setup: and used them in our player object. Now let's make some live changes and see them reflected in the player

## What's Next?
