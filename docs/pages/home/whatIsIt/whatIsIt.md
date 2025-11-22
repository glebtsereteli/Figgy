

# What is Figgy?
![alt text](banner.png)
## Overview

Figgy is a pure GML [Free and Open Source](https://en.wikipedia.org/wiki/Free_and_open-source_software) lightweight GameMaker library - a centralized and persistent live configuration system for seamless game tuning and balancing.

## Why Use It?

Figgy eliminates the constant cycle of recompiling and searching through assets to adjust gameplay values. After defining your stats and parameters in Setup, Figgy automatically builds a :Debug Overlay: interface that lets you live-edit values while the game is running, access them in code, and save changes directly within your project's datafiles.

Whether you're a solo developer or part of a team, working on a big project or a weekend-long game jam, Figgy streamlines balancing and tuning, keeping iteration fast and effortless. It also gives your non-programmer team members full design control without touching a single line of code.

## Features

⚙️ **Automatic Live :Interface:**. Figgy creates [debug views](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/The_Debug_Overlay.htm#:~:text=using%C2%A0dbg_view.-,Views,-This%20menu%20lists) for your configs automatically, freeing you from dreaded UI coding of any kind and allowing for live editing.

🗂️ **Flexible Data Structure**. Organize your configs using a robust struct-based tree-like JSON layout with :Scope Widgets:, including :Windows:, :Sections:, and :Groups:.

🎛️ **Wide Data Type Coverage**. Built on GameMaker's cross-platform :Debug Overlay:, Figgy provides several :Value Widgets: for all commonly used data types: :Ints:, :Floats:, :Reals:, :Bools:, :Strings:, :Colors: and :Anys:.

💾 **Persistent Project Storage**. Keep your configs inside your GitHub repo with Figgy's automatic (and optionally [obfuscated](/pages/home/persistence/#obfuscate)) datafiles [saving & loading](/pages/home/persistence) support that tracks variables differing from default values (or the whole config, if specified).

🧠 **Centralized Configuration**. Keep all gameplay values in one place and read them from the config struct - no more scattered Create-event variables or magic numbers.

👨‍🎨 **Code-Free Design**. Allow your designers to tweak and balance the game live without ever having to touch code. Everything is accessible through the :Interface:.

## Games Using Figgy

* [DirtWorld](https://jbw-games.itch.io/dirtworld) by [Joe Baxter-Webb (Indie Game Clinic)](https://indiegameclinic.com/).
* tobu by [Thomas Threlfo](https://bsky.app/profile/tthrelfo.bsky.social).
* And more to come :)

<!-- <!-- ## Alternatives

* GMLive
* dropbox/sheets to gm
* json/yaml/csv with custom live reloading -->

<!-- the figgy workflow can effectively be divided into 4 parts - setup, interface, struct, and file

setup ➜ interface ➜ struct ➜ file

### 1. Setup

* first we setup up our widgets in `FiggySetup()`
::: code-group
```js [Setup]

```
:::

### 2. Interface

* that creates a DBG interface that we use to balance the game live by changing configs, save them to file, reset them, etc
TODO screenshot

### 3. Data Struct

* it also builds a data struct that we use to access config values in our code at runtime
::: code-group
```js [Setup]

```
:::

### 4. File

* from that data structs comes the final data file that is saved into datafiles

this is where the "persistent" part of the system comes from. once the interface is established, the intended workflow is to open the game, balance it live, save the changes, and then commit and push the to your repo. in case of working with designers, they do it on their own branch that you - the developer, then merge into your branch, develop features, merge your branch into theirs and the cycle continues 

keep in mind that by default, delta saving is enabled and you will only see values that differ from defaults in the config file saved into datafiles -->
