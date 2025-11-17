
# Figgy API

This page provides an overview of the top-level Figgy API structure. The API is divided into three core parts: [FiggySetup()](#figgysetup), [Figgy Namespace Interface](#figgy-namespace-interface), and [Configuration](#configuration). 

## `FiggySetup()`

Everything starts with :Setup: through the `FiggySetup()` global function — the entry point of the library where you define your :Scope Widgets:, :Value Widgets:, and :Decor Widgets:.

Figgy uses these definitions to construct the :Interface: and compile the config data for you to use throughout your game code. 

## `Figgy` Namespace Interface

Inside and outside of Setup, the `Figgy` interface provides access to all library features: :Setup:, :Getters:, :Resetters:, and :Input/Output:.

`Figgy` is a global function containing static data variables and methods, effectively acting as a makeshift [namespace](https://learn.microsoft.com/en-us/cpp/cpp/namespaces-cpp?view=msvc-170)-like construct. It's initialized internally and requires no setup.

All methods are accessed using the `Figgy.MethodName(arguments...)` syntax.
:::code-group
```js [Example]
function FiggySetup() {
    Figgy.Window("Player"); // [!code focus]
        Figgy.NoScope().Section("Movement"); // [!code focus]
            Figgy.Float("Run Speed", 5, 0.1, 10); // [!code focus]
}
```
:::
Note the lack of parentheses after `Figgy`. Unlike the classic `function_name()` calls you're used to in GML, this accesses static methods within the Figgy interface.

This design offers a single, clean entry point for the entire library, with all internal data and public methods contained within a single "namespace".

## Configuration

[Configuration Macros](/pages/api/config.md) control how the interface is built, how config files are saved and loaded, and how various Widgets behave at runtime.
