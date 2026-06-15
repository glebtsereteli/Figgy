# Frequently Asked Questions

This page contains answers to frequently asked questions about Figgy.

## 📍 What platforms does Figgy support?

| Platform | Status |
| --- | --- |
| Windows | ✅ Fully supported |
| macOS | ✅ Fully supported |
| Linux | ✅ Fully supported |
| GX.games | ✅🚧 Everything but :Input/Output: |
| Android | 🚧 Planned |
| iOS | 🚧 Planned |
| PS5 | 🚧 Planned |
| Xbox | 🚧 Planned |
| Nintendo Switch | 🚧 Planned |
| HTML5 | ❌ Not planned |

## 📍 What versions of GameMaker does Figgy support?

Figgy supports GameMaker version [LTS 2026.0](https://releases.gamemaker.io/release-notes/2026/0) and above.

## 📍 How is Figgy licensed? Can I use it in commercial projects?

Figgy is licensed under the [MIT license](https://github.com/glebtsereteli/Figgy/blob/main/LICENSE), granting you full freedom to use it for any purpose, including commercial projects. The only requirement is to include the `Figgy License.txt` file that comes with the library package.

Mentioning my name (Gleb Tsereteli) in your game's credits would be greatly appreciated and would totally make my day, but it's entirely optional 🙂

## 📍 How do I update to the latest version of Figgy?

1. Back up your :Setup: from the `FiggySetup` script and any modified configs from the `FiggyConfig` script.
2. Delete the `Figgy` folder from your project.
3. Repeat the [Installation](/pages/home/gettingStarted/gettingStarted#installation) process.
4. Paste your :Setup: back into the `FiggySetup` script, and reapply your config changes in the `FiggyConfig` script.

::: tip SEMANTIC VERSIONING
Figgy follows the [Semantic Versioning](https://semver.org/) pattern.
- Change to the first number indicate a major release and may include breaking changes or require code refactoring.
- Changes to the second or third number are minor or patch releases and typically don't require any changes on your end. 
For example, upgrading from `v1.4.2` to `v2.0.0` is a major upgrade, while `v1.3.0` to `v1.4.0` or `v1.3.1` is a safe, non-breaking update.
:::

::: warning KEEP IN MIND
Config structure might change between versions. Always check the release notes and update your restored configs if needed.
:::