---
next:
  text: 'Value Widgets'
  link: '/pages/api/valueWidgets'
---

# Scope Widgets

## Overview

## <u>Window</u>
`Figgy.Window(name, [visible], [x], [y], [width], [height])` ➜ `Struct.Figgy`

Creates a struct at the Root level, represented as a DBG View.

Once called, the Root scope becomes inaccessible. All following Widgets will be created in the context of the current Window. Call this method again to switch the scope to another Window.

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `name`    | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm)  | The window name. | - |
| `visible` | [Bool](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | Whether the window should start visible (`true`) or not (`false`). | `FIGGY_WINDOW_DEFAULT_START_VISIBLE` |
| `x`       | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | The x position of the window. | `FIGGY_WINDOW_DEFAULT_X` |
| `y`       | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | The y position of the window. | `FIGGY_WINDOW_DEFAULT_Y` |
| `width`   | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | The width of the window. | `FIGGY_WINDOW_DEFAULT_WIDTH` |
| `height`  | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | The height of the window. | `FIGGY_WINDOW_DEFAULT_HEIGHT` |

::: info Examples

* Creates a `"player"` Window. Skips visibility, position and size optional arguments.
```js
function FiggySetup() {
    Figgy.Window("player");
        // Widgets here...
}
```
* Creates an `"enemy"` Window at the top-right corner of the game window, hidden by default.
```js
function FiggySetup() {
    var _width = 300;
    var _xPad = 8;
    var _x = window_get_width() - _width - _xPad;
    Figgy.Window("enemy", false, _x, FIGGY_WINDOW_DEFAULT_Y, _width);
        // Widgets here...
}
```
:::

---
## <u>Section</u>
`Figgy.Section(name, [scoped], [open])` ➜ `Struct.Figgy`

* If `scoped`, creates a struct at the current scope (Root/Window), represented as a DBG Section.  
Once called, the previous non-Section scope (Root or Window) becomes inaccessible. All following Widgets will be created in the context of the current Section.  
Call this method again to switch the scope to another Section.  
* If not `scoped`, acts as a purely visual DBG Section.

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `name`    | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm) | The section name. | — |
| `scoped`  | [Bool](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)   | Whether the section creates a new scope (`true`) or not (`false`). | `true` |
| `open`    | [Bool](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)   | Whether the section starts open (`true`) or not (`false`). | `FIGGY_SECTION_DEFAULT_OPEN` |

::: info Examples

:::

---
## <u>Group</u>
`Figgy.Section(name, [scoped], [align])` ➜ `Struct.Figgy`

* IF `scoped`, creates a struct at the current scope (Root, Window, or Section), represented as a DBG Text Separator.  
Once called, all following Value Widgets will be created in the context of the current Group.  
* If not `scoped`, acts as a purely visual DBG Text Separator.

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `name`    | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm) | The group name. | — |
| `scoped`  | [Bool](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)   | Whether the section creates a new scope (`true`) or not (`false`). | `true` |
| `align`   | [Enum](https://manual.gamemaker.io/beta/en/GameMaker_Language/GML_Overview/Variables/Constants.htm#:~:text=of%20this%20page.-,Enums,-An%20enum%20is).FIGGY_GROUP_ALIGN | The group name alignment. | `FIGGY_GROUP_DEFAULT_ALIGN` |


::: info Examples

:::
