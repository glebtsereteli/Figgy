# What is Figgy?

## Overview



## Features




## How does it work?

the figgy workflow can effectively be divided into 4 parts - setup, interface, struct, and file

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

keep in mind that by default, delta saving is enabled and you will only see values that differ from defaults in the config file saved into datafiles

## Alternatives

* gmlive
* dropbox/sheets to gm
* json/yaml/csv with custom live reloading

## Games Using Figgy

* [DirtWorld](https://jbw-games.itch.io/dirtworld) by [Joe Baxter-Webb](https://indiegameclinic.com/).
* tobu by [Thomas Threlfo](https://bsky.app/profile/tthrelfo.bsky.social).

