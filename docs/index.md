---

layout: home

hero:
  name: Figgy
  text: Persistent live configs for GameMaker
  tagline: Balance your game efficiently with a centralized, persistent and live-editable config manager.
  actions:
    - theme: brand
      text: What is Figgy?
      link: '/pages/home/whatIsIt'
    - theme: alt
      text: Get Started
      link: '/pages/home/gettingStarted/gettingStarted'
  image:
    src: /logoBig.png
    alt: Icon

features:
  - title: ⚙️ Automatic Live Interface
    details: Figgy creates debug view(s) for your configs automatically, freeing you from dreaded UI coding of any kind and allowing for live editing.
  - title: 🗂️ Flexible Data Structure
    details: Organize your configs using a robust struct-based tree-like JSON layout with Window, Section and Group Scope Widgets.
  - title: 🎛️ Wide Data Type Coverage
    details: Built on GM's cross-platform DBG system, Figgy provides many Value Widgets for all commonly used data types (Reals, Bools, Strings, Colors).
  - title: 💾 Persistent Project Storage
    details: Keep your configs inside your GitHub repo with Figgy's datafiles saving/loading support that tracks variables differing from default values.
  - title: 🧠 Centralized Configuration
    details: Keep all gameplay values in one place and read them from the config struct - no more scattered Create-event variables or magic numbers.
  - title: 👨‍🎨 Code-Free Design
    details: Allow your designers to tweak and balance the game live without ever having to touch code. Everything is accessible through the interface.

---

<hr style="border: none; border-top: 2px solid #888; margin:4em 0 1em;" />

<div style="text-align:center; font-size:1.1em; color:#555; margin-bottom:2em;">
  <strong>Figgy</strong> Team
</div>

<script setup>
import { VPTeamMembers } from 'vitepress/theme'

const team = [
  {
    avatar: 'https://avatars.githubusercontent.com/u/50461722?v=4',
    name: 'Gleb Tsereteli',
    title: 'Developer',
    links: [
      { icon: 'github', link: 'https://github.com/GlebTsereteli' },
      { icon: 'twitter', link: 'https://x.com/GlebTsereteli' },
    ]
  },
  {
    avatar: 'neeri.jpg',
    name: 'Neeri',
    title: 'Promo Art',
    links: [
      { icon: 'bluesky', link: 'https://bsky.app/profile/neerikiffu.bsky.social' },
      { icon: 'instagram', link: 'https://www.instagram.com/neerikiffu/' },
    ]
  }
]
</script>

<VPTeamMembers :members="team" />
