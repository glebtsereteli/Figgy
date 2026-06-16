
# Figgy v1.1.0 Test

## Welcome!

Welcome to the [Figgy](https://github.com/glebtsereteli/Figgy) test project!

This project is a minimal unit-test setup for the library, with no game attached. It exists purely to exercise every Setup widget in one place and serve as a feature reference. For a guided introduction, check out the [Getting Started](https://glebtsereteli.github.io/Figgy/pages/home/gettingStarted/gettingStarted) guide.

## What's Included

The test project includes a complete `FiggySetup()` definition that exercises every Setup widget, organized into Player, Enemies, World and Transition windows. It covers all three widget categories ([Scope](https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup#scope-widgets), [Value](https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup#value-widgets) and [Decor](https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup#decor-widgets)) along with the [OnChange](https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup#onchange) callback system, and renders the live config tree on screen so you can watch values update as you edit them through the interface.

Learn more about the setup process in the [Setup Documentation](https://glebtsereteli.github.io/Figgy/pages/api/figgy/setup).

## Figgy in Real Games

If you want to see Figgy implemented across different game scenarios, check out the GM Template demos.

Figgy comes with three fully integrated demos, each built on top of one of GameMaker's official template projects. These demos show how easily Figgy can slot into any codebase, no matter the genre or architecture.

* [Platformer](https://github.com/glebtsereteli/Figgy/releases/latest/download/Figgy.Demo.GMTemplate.Platformer.yyz)
* [Survivor](https://github.com/glebtsereteli/Figgy/releases/latest/download/Figgy.Demo.GMTemplate.Survivor.yyz)
* [Hero's Trail](https://github.com/glebtsereteli/Figgy/releases/latest/download/Figgy.Demo.GMTemplate.Hero.s.Trail.yyz)

Each demo takes the unmodified template project and layers Figgy on top with the smallest possible amount of glue code. All original mechanics are preserved. Hard coded [magic numbers](https://en.wikipedia.org/wiki/Magic_number_(programming)) and Create-event variables are replaced with persistent, live-editable Figgy configs that you can tweak at runtime.

## Need Help?

If you have questions or need help implementing Figgy into your game, visit the dedicated [#gleb___figgy](https://discord.com/channels/724320164371497020/1457226777024925786) support channel on the [GameMaker Kitchen](https://discord.gg/gamemakerkitchen) Discord server.

See the [Contact & Support](https://glebtsereteli.github.io/Figgy/pages/others/contactSupport#contact-support) section of the documentation for more information.
