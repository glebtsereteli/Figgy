
<img width="1280" height="300" alt="banner" src="https://github.com/user-attachments/assets/9e31e7d0-c9d8-40fa-abb8-e15c1ce28479" />

<!-- <h1 align="center">Figgy v1.0.0 </h1> -->
<!-- <p align="center"> Persistent live configs for GameMaker 2024.14+ </p> -->

# Figgy v1.0.0
Figgy is a pure GML [Free and Open Source](https://en.wikipedia.org/wiki/Free_and_open-source_software) lightweight GameMaker library - a centralized and persistent live configuration system for seamless game tuning and balancing.

* ℹ️ Download the `.yymps` local package from the [Releases](https://github.com/glebtsereteli/Figgy/releases) page.
* ℹ️ Refer to the [Documentation](https://glebtsereteli.github.io/Figgy/) for installation instructions, usage examples and full API reference.
* ℹ️ **GameMaker Version:** [v2024.14](https://releases.gamemaker.io/release-notes/2024/14) (the latest Monthly).
* ℹ️ **Platforms:** Windows, macOS and Linux are fully supported. GX.games supports everything but IO. Console & Mobile support is planned. HTML5 support is not planned.

<details>

<summary>Screenshots</summary>

<img width="1920" height="1080" alt="7f1I_k" src="https://github.com/user-attachments/assets/e4c219f0-9d7a-4e83-84ae-d09a5ce8b43b" />
<img width="1920" height="1080" alt="ciM2Zt" src="https://github.com/user-attachments/assets/a1b743a3-1482-4d4c-aa0b-c16484d15dce" />
<img width="1920" height="1080" alt="8zMl9R" src="https://github.com/user-attachments/assets/8727d8d1-1d30-402b-888d-3ca681e794db" />
<img width="1920" height="1080" alt="7+z+lJ" src="https://github.com/user-attachments/assets/dd164707-250b-457b-bf3b-13889a77b57a" />

</details>

## Why Use It?
Figgy eliminates the constant cycle of recompiling and searching through assets to adjust gameplay values. After defining your stats and parameters in Setup, Figgy automatically builds a Debug Overlay interface that lets you live-edit values while the game is running, access them in code, and save changes directly within your project's datafiles.

Whether you're a solo developer or part of a team, working on a big project or a weekend-long game jam, Figgy streamlines balancing and tuning, keeping iteration fast and effortless. It also gives your non-programmer team members full design control without touching a single line of code.

# Features
⚙️ **Automatic Live Interface**. Figgy creates debug view(s) for your configs automatically, freeing you from dreaded UI coding of any kind and allowing for live editing.

🗂️ **Flexible Data Structure**. Organize your configs using a robust struct-based tree-like JSON layout with Window, Section and Group Scope Widgets.

🎛️ **Wide Data Type Coverage**. Built on GameMaker's cross-platform Debug Overlay, Figgy provides many Value Widgets for all commonly used data types (Numbers, Booleans, Strings, Colors).

💾 **Persistent Project Storage**. Keep your configs inside your GitHub repo with Figgy's automatic (and optionally obfuscated) datafiles saving/loading support that tracks variables differing from default values (or the whole config, if specified).

🧠 **Centralized Configuration**. Keep all gameplay values in one place and read them from the config struct - no more scattered Create-event variables or magic numbers.

👨‍🎨 **Code-Free Design**. Allow your designers to tweak and balance the game live without ever having to touch code. Everything is accessible through the interface.

# Credits
* Created and maintained by [Gleb Tsereteli](https://twitter.com/glebtsereteli).
* Wonderful promo art by the very talented [neerikiffu](https://bsky.app/profile/neerikiffu.bsky.social)!
* Initially created as a submission for [TabularElf](https://tabelf.link/)'s [CookBook Jam #5](https://itch.io/jam/cookbook-jam-5).
* Thanks to [Gutpunch Studios](https://gutpunchstudios.com/) for the original "knobs and levers" design philosophy and inspiration.
* Thanks to [Omar Cornut](https://www.miracleworld.net/) for making the infinitely useful [Dear ImGui](https://github.com/ocornut/imgui) and the GameMaker team for implementing it in the [Debug Overlay](https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/The_Debug_Overlay.htm).
* Thanks to [Thomas Threlfo](https://bsky.app/profile/tthrelfo.bsky.social) and [Joe Baxter-Webb](https://indiegameclinic.com/) for initial testing.
* Demo graphics by [Pixel Frog](https://x.com/PixelFrogStudio).

# Games Using Figgy
* [DirtWorld](https://krankenhaus-uk.itch.io/dirtworld) by [Joe Baxter-Webb (Indie Game Clinic)](https://indiegameclinic.com/).
* [Thomas Threlfo](https://bsky.app/profile/tthrelfo.bsky.social)'s tobu.
* And more to come :)
