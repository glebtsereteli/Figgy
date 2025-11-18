# Input/Output

## Overview

Input/Output methods let you :.Import(): and :.Export(): the current Figgy config to/from any custom path on your system. This is especially useful for sharing configs between team members during balancing sessions, allowing everyone to quickly load and review each other's setups.

You can also use these methods to integrate Figgy with any custom tooling you might build. I haven't encountered a workflow that needs this yet, but please let me know if you come up with a real-world use case!

## Methods

### `.Import()`

> `Figgy.Import([path])` ➜ :Struct:.:Figgy:

Imports a Figgy config struct from an external file at the specified path.

If no path is provided, the method will automatically open a file selection dialog via [get_open_filename_ext()](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/File_Handling/File_System/get_open_filename_ext.htm), letting you pick a file from anywhere on your system. The available files are filtered based on the :FIGGY_FILE_EXT: config macro.

| Parameter | Type | Description |
| --- | --- | --- |
| `[path]` | :String: | The path to import from [Default: opens selection dialog] |

::: code-group
```js [Example]
// Imports a Figgy config from the given path: [!code highlight]
Figgy.Import("...someCustomPath/config.figgy");

// Imports a Figgy config from the path chosen in the file selection dialog: [!code highlight]
Figgy.Import();
```
:::

---
### `.Export()`

> `Figgy.Export([path])` ➜ :Struct:.:Figgy:

Exports the current Figgy config struct to an external file at the specified path.

If no path is provided, the method will open a file selection dialog via [get_save_filename_ext()](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/File_Handling/File_System/get_save_filename_ext.htm), letting you pick where to save the file on your system. The file extension is dictated by the :FIGGY_FILE_EXT: config macro.

| Parameter | Type | Description |
| --- | --- | --- |
| `[path]` | :String: | The path to export to [Default: opens selection dialog] |

::: code-group
```js [Example]
// Exports the current Figgy config to the given path: [!code highlight]
Figgy.Export("...someCustomPath/config.figgy");

// Exports the current Figgy config to the path chosen in the file selection dialog: [!code highlight]
Figgy.Export();
```
:::
