# Figgy Demo - GameMaker Survivor Template

Welcome to the GMTemplate Survivor Figgy demo!

This project demonstrates how easily Figgy can be integrated into an existing GameMaker project.

In this demo, we're using GameMaker's official [Survivor template](https://gamemaker.io/en/blog/survivor-gamemaker-template) as a base project. All mechanics are preserved exactly as they are in the original template.

The only additions are Figgy configs and the minimal glue needed to connect them to the game. Create-event variables and magic numbers are replaced with persistent, live-editable Figgy configs.

## Implementation Details

* All Figgy inserts are marked with `// @Figgy` comments. Search for that globally (press **Ctrl+Shift+F** to bring up global search) to find all Figgy-touched pieces of code.
* See out the `FiggySetup()` function to see the config layout for this project.
* The game is initialized inside the `initialize_game()` function that is called in the first room's Creation Code. The room is named `rm_init`.
* There is a helper object called `obj_debug_manager`. It is persistent and only used for toggling the [Debug Overlay](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/The_Debug_Overlay.htm) with **F1**.
* You can find these assets in the `02. Figgy Implementation` folder in the Asset Browser.
* Mouse movement is blocked when you hover over the Debug Overlay via [is_mouse_over_debug_overlay()](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/is_mouse_over_debug_overlay.htm).

## What's Next?

* Download the latest release from the [GitHub](https://github.com/glebtsereteli/Figgy) repository or the [Itch](https://glebtsereteli.itch.io/figgy) page.
* See the [Getting Started](https://glebtsereteli.github.io/Figgy/pages/home/gettingStarted/gettingStarted) section of the documentation to learn how to start using Figgy in your own projects.
* Check out the frequently asked questions in the [FAQ](https://glebtsereteli.github.io/Figgy/pages/home/faq) section.
* Learn everything else there is to know about the library in the [Documentation](https://glebtsereteli.github.io/Figgy/).

----

If you find Figgy useful, please consider giving it a good rating on [Itch](https://glebtsereteli.itch.io/figgy) and a star on [GitHub](https://github.com/glebtsereteli/Figgy)!

Also, if you're using Figgy in one of your projects, please let me know! That would make my day.

Have fun, and go conFiggyre your games! :)
