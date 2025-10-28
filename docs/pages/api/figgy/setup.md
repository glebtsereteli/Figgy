# Setup

## Scope Widgets

Overview...

### .Window()

> `Figgy.Window(name, [visible?], [x], [y], [width], [height])` ➜ :Struct:.:Figgy:

Creates a struct at the Root scope, represented as a DBG View (window).

Once called, the Root scope becomes inaccessible. All following Widgets will be created in the context of the current Window. Call this method again to switch scope to another Window.

| Parameter | Type | Description |
|-----------|------|-------------|
| `name` | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm)  | The window name |
| `[visible]` | [Bool](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | Whether the window should start visible (`true`) or not (`false`) [Default: FIGGY_WINDOW_DEFAULT_START_VISIBLE] |
| `[x]` | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | The x position of the window [Default: FIGGY_WINDOW_DEFAULT_X] |
| `[y]` | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | The y position of the window [ Default: FIGGY_WINDOW_DEFAULT_Y] |
| `[width]`   | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | The width of the window [Default: FIGGY_WINDOW_DEFAULT_WIDTH] |
| `[height]`  | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm)  | The height of the window [Default: FIGGY_WINDOW_DEFAULT_HEIGHT] |

::: code-group
```js [Example]
function FiggySetup() {
    Figgy.Window("player");
        // Widgets here...
}
```
:::

### .Section()

> `Figgy.Section(name, [scoped?], [open?])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

### .Group()

> `Figgy.Group(name, [scoped?], [align])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

## Value Widgets

Overview...

### .Int()

> `Figgy.Int(name, default, min, max, [step], [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

### .Float()

> `Figgy.Float(name, default, min, max, [step], [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

### .Bool()

> `Figgy.Bool(name, default, [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

### .Text()

> `Figgy.Text(name, default, [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

### .Color()

> `Figgy.Color(name, default, [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

### .Multi()

> `Figgy.Multi(name, default, values, names, [onChange])` ➜ :Struct:.:Figgy:

Description...

::: code-group
```js [Example]
asdasd
```
:::

## Decor Widgets

### .Button()

### .Comment()

### .Separator()

## OnChange

### .OnChangeSet()

### .OnChangeReset()
