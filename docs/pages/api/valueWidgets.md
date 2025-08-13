---
next:
  text: 'Decor Widgets'
  link: '/pages/api/decorWidgets'
---

# Value Widgets

## Overview

## <u>Int</u>
`Int(name, default, min, max, [step], [onChange])` ➜ `Struct.Figgy`

Creates a Real value in the current scope (Root, Window, Section or Group), represented as a DBG Slider.  
The onChange callback function receives 3 arguments: (new value, old value, variable name).

| Parameter   | Type | Description | Default |
|------------|------|-------------|---------|
| `name`     | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm) | The variable name. | — |
| `default`  | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | The default value. | — |
| `min`      | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | The minimum value. | — |
| `max`      | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | The maximum value. | — |
| `step`     | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | Step value. | `FIGGY_INT_DEFAULT_STEP` |
| `onChange` | [Function](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Script_Functions.htm) | Function called on value change | current `onChange` callback/`FIGGY_CHANGES_DEFAULT_CALLBACK` |

::: info Examples

:::

---
## <u>Float</u>
`Float(name, default, from, to, [step], [onChange])` ➜ `Struct.Figgy`

Creates a Real value in the current scope (Root, Window, Section or Group), represented as a DBG Float Slider.  
The onChange callback function receives 3 arguments: (new value, old value, variable name).

| Parameter   | Type | Description | Default |
|------------|------|-------------|---------|
| `name`     | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm) | The variable name. | — |
| `default`  | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | The default value. | — |
| `from`     | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | The minimum value. | — |
| `to`       | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | The maximum value. | — |
| `step`     | [Real](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | Step value. | `FIGGY_FLOAT_DEFAULT_STEP` |
| `onChange` | [Function](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Script_Functions.htm) | Function called on value change | current `onChange` callback/`FIGGY_CHANGES_DEFAULT_CALLBACK` |

::: info Examples

:::

---
## <u>Bool</u>
`Bool(name, default, [onChange])` ➜ `Struct.Figgy`

Creates a Boolean value in the current scope (Root, Window, Section or Group), represented as a DBG Checkbox.  
The `onChange` callback function receives 3 arguments: (new value, old value, variable name).

| Parameter   | Type | Description | Default |
|------------|------|-------------|---------|
| `name`     | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm) | The variable name. | — |
| `default`  | [Bool](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | The default value. | — |
| `onChange` | [Function](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Script_Functions.htm) | Function called on value change | current `onChange` callback/`FIGGY_CHANGES_DEFAULT_CALLBACK` |

::: info Examples

:::


---
## <u>Text</u>
`Text(name, default, [onChange])` ➜ `Struct.Figgy`

Creates a String value in the current scope (Root, Window, Section or Group), represented as a DBG Text Input.  
The `onChange` callback function receives 3 arguments: (new value, old value, variable name).

| Parameter   | Type | Description | Default |
|------------|------|-------------|---------|
| `name`     | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm) | The variable name. | — |
| `default`  | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm) | The default value. | — |
| `onChange` | [Function](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Script_Functions.htm) | Function called on value change | current `onChange` callback/`FIGGY_CHANGES_DEFAULT_CALLBACK` |

::: info Examples

:::

---
## <u>Multi</u>
`Multi(name, default, values, [names], [onChange])` ➜ `Struct.Figgy`

Value Widget: creates an `Any` value in the current scope (Root, Window, Section or Group), represented as a DBG Dropdown.  
The onChange callback function receives 3 arguments: (new value, old value, variable name).

| Parameter   | Type | Description | Default |
|------------|------|-------------|---------|
| `name`     | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm) | The dropdown name. | — |
| `default`  | Any | The default value. | — |
| `values`   | [Array](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Arrays.htm) of Any | Array of option values. | — |
| `names`    | [Array](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Arrays.htm) of String | Array of option names. | `values` |
| `onChange` | [Function](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Script_Functions.htm) | Function called on value change | current `onChange` callback/`FIGGY_CHANGES_DEFAULT_CALLBACK` |

::: info Examples

:::


---
## <u>Color</u>
`Color(name, default, [onChange])` ➜ `Struct.Figgy`

Creates a color value in the current scope (Root, Window, Section or Group), represented as a DBG Color Picker.  
The onChange callback function receives 3 arguments: (new value, old value, variable name).

| Parameter   | Type | Description | Default |
|------------|------|-------------|---------|
| `name`     | [String](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Strings/Strings.htm) | The variable name. | — |
| `default`  | [Real, Constant.Color](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Data_Types.htm) | The default value. | — |
| `onChange` | [Function](https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Overview/Script_Functions.htm) | Callback called when value changes | current `onChange` callback/`FIGGY_CHANGES_DEFAULT_CALLBACK` |

::: info Examples

:::
