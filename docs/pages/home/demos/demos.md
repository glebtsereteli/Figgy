# Demos

## Overview

Figgy comes with three fully integrated demos, each built on top of one of GameMaker's official template projects. These demos show how easily Figgy can slot into any codebase, no matter the genre, architecture, or how well the original code is written.

<div style="display:flex;gap:12px;justify-content:space-between;flex-wrap:wrap;width:100%">
  <figure style="text-align:center;flex:1;min-width:150px">
    <img src="/pages/home/demos/demoPlatformer.png" style="width:100%;max-width:220px" data-zoomable>
    <figcaption><a href="https://github.com/glebtsereteli/Figgy/releases/download/v1.0.0/Figgy.Demo.GMTemplate.Platformer.yyz" target="_blank" rel="noopener noreferrer">Platformer</a></figcaption>
  </figure>
  <figure style="text-align:center;flex:1;min-width:150px">
    <img src="/pages/home/demos/demoSurvivor.png" style="width:100%;max-width:220px" data-zoomable>
    <figcaption><a href="https://github.com/glebtsereteli/Figgy/releases/download/v1.0.0/Figgy.Demo.GMTemplate.Survivor.yyz" target="_blank" rel="noopener noreferrer">Survivor</a></figcaption>
  </figure>
  <figure style="text-align:center;flex:1;min-width:150px">
    <img src="/pages/home/demos/demoHero.png" style="width:100%;max-width:220px" data-zoomable>
    <figcaption><a href="https://github.com/glebtsereteli/Figgy/releases/download/v1.0.0/Figgy.Demo.GMTemplate.Hero.s.Trail.yyz" target="_blank" rel="noopener noreferrer">Hero's Trail</a></figcaption>
  </figure>
</div>

---

Each demo takes the unmodified template project and layers Figgy on top with the smallest possible amount of glue code. All original mechanics are preserved.

Hard coded [magic numbers](https://en.wikipedia.org/wiki/Magic_number_(programming)) and Create-event variables are replaced with persistent, live-editable Figgy configs that you can tweak at runtime. 

## Implementation Details

* All Figgy-related changes are marked with `// @Figgy` comments. Search for it globally (**Ctrl+Shift+F** brings up global search) to see how Figgy is inserted into the code.
* Helper Figgy assets are grouped in the `02. Figgy Implementation` folder.
* The :Debug Overlay: can be toggled with **F1** through the `obj_debug_manager` object.
* Mouse input (both for UI interactions and in-game movement) is blocked when hovering over the overlay using [is_mouse_over_debug_overlay()](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/is_mouse_over_debug_overlay.htm), preventing unwanted input while editing configs.
