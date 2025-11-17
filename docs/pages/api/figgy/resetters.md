# Resetters

## Overview

Resetter methods let you restore the current Figgy config to one the following states.
* The **Initial** state using :.ResetToInitial():, captured after defaults are initialized in :Setup: and saved changes (if any) are loaded at game startup.
* The **Default** state using :.ResetToDefault():, captured after default values are initialized in :Setup:, before saved changes (if any) are loaded at game startup.

These methods are primarily used within the :Interface:, but they are exposed for you to use wherever you might need them.

## Methods

###  

### `.ResetToInitial()`

> `Figgy.ResetToInitial()` ➜ :Struct:.:Figgy:

Resets the current Figgy config to the **Initial** state, captured after default values are initialized in :Setup: and saved changes (if any) are loaded at game startup.

:::code-group
```js [Example]
Figgy.ResetToInitial(); // Resets config to Initial.
```
:::

---
### `.ResetToDefault()`

> `Figgy.ResetToDefault()` ➜ :Struct:.:Figgy:

Resets the current Figgy config to the **Default** state, captured after default values are initialized in :Setup:, before saved changes (if any) are loaded at game startup.

:::code-group
```js [Example]
Figgy.ResetToDefault(); // Resets config to Default.
```
:::
