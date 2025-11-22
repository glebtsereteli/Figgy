import { defineConfig } from 'vitepress'
import MarkdownIt from 'markdown-it'

export default defineConfig({
  base: '/Figgy/',
  cleanUrls: true,

  ignoreDeadLinks: true,
  lastUpdated: true,

  title: "Figgy",
  description: "Figgy Documentation",
  head: [
    ['link', { rel: 'icon', href: 'logoSmall.png' }],

    // embeds
    ["meta", { property: "og:title", content: "Figgy Documentation" }],
    ["meta", { property: "og:description", content: "Documentation for the Figgy GameMaker library. Setup instructions, usage examples and full API coverage." }],
    ["meta", { property: "og:type", content: "website" }],
    ["meta", { property: "og:url", content: "https://glebtsereteli.github.io/Figgy/" }],
    ["meta", { property: "og:image", content: "https://glebtsereteli.github.io/Figgy/socialEmbed.png" }],

    ["meta", { name: "twitter:card", content: "summary_large_image" }],
    ["meta", { name: "twitter:title", content: "Figgy Documentation" }],
    ["meta", { name: "twitter:description", content: "Documentation for the Figgy GameMaker library. Setup instructions, usage examples and full API coverage." }],
    ["meta", { name: "twitter:image", content: "https://glebtsereteli.github.io/Figgy/socialEmbed.png" }],
  
    // analytics
    [
      'script',
      { async: '', src: 'https://www.googletagmanager.com/gtag/js?id=G-5T6N7GGRNE' }
    ],
    [
      'script',
      {},
      `window.dataLayer = window.dataLayer || [];
       function gtag(){dataLayer.push(arguments);}
       gtag('js', new Date());
       gtag('config', 'G-Y7N1YYYGY7');`
    ]
  ],

  themeConfig: {
    logo: '/logoSmall.png',

    search: {
      provider: 'local'
    },

    nav: [
      {
        text: 'Guide',
        items: [
          {
            text: '🏡 Home',
            items: [
              { text: 'What is Figgy?', link: '/pages/home/whatIsIt/whatIsIt' },
              { text: 'Getting Started', link: '/pages/home/gettingStarted/gettingStarted' },
              { text: 'Demos', link: '/pages/home/demos/demos' },
              { text: 'FAQ', link: '/pages/home/faq' },
            ]
          },
          {
            text: '📝 Concepts',
            items: [
              { text: 'Interface', link: '/pages/home/interface/interface' },
              { text: 'Persistence', link: '/pages/home/persistence' },
            ]
          },
          {
            text: '🗂️ Others',
            items: [
              { text: 'Contact & Support', link: '/pages/others/contactSupport' },
              { text: 'Upcoming Features', link: '/pages/others/upcomingFeatures' },
              { text: 'Credits', link: '/pages/others/credits' },
            ]
          }
        ]
      },
      { 
        text: 'API',
        activeMatch: '^/pages/api/',
        items: [
          { text: '📖 Overview', link: '/pages/api/figgy/overview' },
          { 
            text: '📜 Figgy',
            items: [
              { text: 'Setup ⭐', link: '/pages/api/figgy/setup' },
              { text: 'Getters', link: '/pages/api/figgy/getters' },
              { text: 'Resetters', link: '/pages/api/figgy/resetters' },
              { text: 'Input/Output', link: '/pages/api/figgy/inputOutput' },
            ]
          },
          { text: '⚙️ Configuration', link: '/pages/api/config', },
        ]
      },
      { text: 'Download', link: 'https://github.com/glebtsereteli/Figgy/releases/v1.0.0' },
    ],
    
    outline: [2, 3],
    sidebar: [
      {
        text: '🏡 Home',
        link: '/pages/home/whatIsIt/whatIsIt',
        items: [
          { text: 'What is Figgy?', link: '/pages/home/whatIsIt/whatIsIt' },
          { text: 'Getting Started', link: '/pages/home/gettingStarted/gettingStarted' },
          { text: 'Demos', link: '/pages/home/demos/demos' },
          { text: 'FAQ', link: '/pages/home/faq' },
        ]
      },
      {
        text: '📝 Concepts',
        items: [
          { text: 'Interface', link: '/pages/home/interface/interface' },
          { text: 'Persistence', link: '/pages/home/persistence' },
        ]
      },
      {
        text: '💻 API',
        items: [
          {
            text: 'Figgy',
            link: '/pages/api/figgy/overview',
            items: [
              { text: 'Setup ⭐', link: '/pages/api/figgy/setup' },
              { text: 'Getters', link: '/pages/api/figgy/getters' },
              { text: 'Resetters', link: '/pages/api/figgy/resetters' },
              { text: 'Input/Output', link: '/pages/api/figgy/inputOutput' },
            ]
          },
          { text: 'Configuration', link: '/pages/api/config' },
        ]
      },
      {
          text: '🗂️ Others',
          link: '/pages/others/contactSupport',
          items: [
            { text: 'Contact & Support', link: '/pages/others/contactSupport' },
            { text: 'Upcoming Features', link: '/pages/others/upcomingFeatures' },
            { text: 'Credits', link: '/pages/others/credits' },
          ]
      },
    ],
    
    socialLinks: [
      { icon: 'github', link: 'https://github.com/glebtsereteli/Figgy' },
      {
        icon: {
          svg: `<svg xmlns="http://www.w3.org/2000/svg" height="235.452" width="261.728" viewBox="0 0 245.37069 220.73612"><path d="M31.99 1.365C21.287 7.72.2 31.945 0 38.298v10.516C0 62.144 12.46 73.86 23.773 73.86c13.584 0 24.902-11.258 24.903-24.62 0 13.362 10.93 24.62 24.515 24.62 13.586 0 24.165-11.258 24.165-24.62 0 13.362 11.622 24.62 25.207 24.62h.246c13.586 0 25.208-11.258 25.208-24.62 0 13.362 10.58 24.62 24.164 24.62 13.585 0 24.515-11.258 24.515-24.62 0 13.362 11.32 24.62 24.903 24.62 11.313 0 23.773-11.714 23.773-25.046V38.298c-.2-6.354-21.287-30.58-31.988-36.933C180.118.197 157.056-.005 122.685 0c-34.37.003-81.228.54-90.697 1.365zm65.194 66.217a28.025 28.025 0 0 1-4.78 6.155c-5.128 5.014-12.157 8.122-19.906 8.122a28.482 28.482 0 0 1-19.948-8.126c-1.858-1.82-3.27-3.766-4.563-6.032l-.006.004c-1.292 2.27-3.092 4.215-4.954 6.037a28.5 28.5 0 0 1-19.948 8.12c-.934 0-1.906-.258-2.692-.528-1.092 11.372-1.553 22.24-1.716 30.164l-.002.045c-.02 4.024-.04 7.333-.06 11.93.21 23.86-2.363 77.334 10.52 90.473 19.964 4.655 56.7 6.775 93.555 6.788h.006c36.854-.013 73.59-2.133 93.554-6.788 12.883-13.14 10.31-66.614 10.52-90.474-.022-4.596-.04-7.905-.06-11.93l-.003-.045c-.162-7.926-.623-18.793-1.715-30.165-.786.27-1.757.528-2.692.528a28.5 28.5 0 0 1-19.948-8.12c-1.862-1.822-3.662-3.766-4.955-6.037l-.006-.004c-1.294 2.266-2.705 4.213-4.563 6.032a28.48 28.48 0 0 1-19.947 8.125c-7.748 0-14.778-3.11-19.906-8.123a28.025 28.025 0 0 1-4.78-6.155 27.99 27.99 0 0 1-4.736 6.155 28.49 28.49 0 0 1-19.95 8.124c-.27 0-.54-.012-.81-.02h-.007c-.27.008-.54.02-.813.02a28.49 28.49 0 0 1-19.95-8.123 27.992 27.992 0 0 1-4.736-6.155zm-20.486 26.49l-.002.01h.015c8.113.017 15.32 0 24.25 9.746 7.028-.737 14.372-1.105 21.722-1.094h.006c7.35-.01 14.694.357 21.723 1.094 8.93-9.747 16.137-9.73 24.25-9.746h.014l-.002-.01c3.833 0 19.166 0 29.85 30.007L210 165.244c8.504 30.624-2.723 31.373-16.727 31.4-20.768-.773-32.267-15.855-32.267-30.935-11.496 1.884-24.907 2.826-38.318 2.827h-.006c-13.412 0-26.823-.943-38.318-2.827 0 15.08-11.5 30.162-32.267 30.935-14.004-.027-25.23-.775-16.726-31.4L46.85 124.08c10.684-30.007 26.017-30.007 29.85-30.007zm45.985 23.582v.006c-.02.02-21.863 20.08-25.79 27.215l14.304-.573v12.474c0 .584 5.74.346 11.486.08h.006c5.744.266 11.485.504 11.485-.08v-12.474l14.304.573c-3.928-7.135-25.79-27.215-25.79-27.215v-.006l-.003.002z" fill="currentColor"/></svg>`,
        },
        link: 'https://glebtsereteli.itch.io/figgy',
      },
      { icon: 'discord', link: 'https://discord.gg/gamemakerkitchen' },
      { icon: 'twitter', link: 'https://x.com/glebtsereteli' },
      { icon: 'bluesky', link: 'https://bsky.app/profile/glebtsereteli.bsky.social' },
    ],

    footer: {
      message: 'Released under the <a href="https://github.com/glebtsereteli/Figgy/blob/main/LICENSE">MIT License</a>. Built with <a href="https://vitepress.dev/">VitePress</a>.',
      copyright: 'Copyright © 2025 <a href="https://github.com/glebtsereteli">Gleb Tsereteli</a>'
    },

    lastUpdated: {
      text: 'Last modified on',
      formatOptions: {
        dateStyle: 'long',
        timeStyle: 'short'
      }
    },
  },
  
  markdown: {
    config: (md: MarkdownIt) => {
      // Base shortcuts — only define once per concept.
      const baseShortcuts: Record<string, string> = {
        'Window': '/pages/api/figgy/setup#window',
        'Section': '/pages/api/figgy/setup#section',
        'Group': '/pages/api/figgy/setup#group',

        'Int': '/pages/api/figgy/setup#int',
        'Float': '/pages/api/figgy/setup#float',
        'Real': '/pages/api/figgy/setup#real',
        'Bool': '/pages/api/figgy/setup#bool',
        'String': '/pages/api/figgy/setup#string',
        'Color': '/pages/api/figgy/setup#color',
        'Any': '/pages/api/figgy/setup#any',
        
        'Button': '/pages/api/figgy/setup#button',
        'Comment': '/pages/api/figgy/setup#comment',
        'Separator': '/pages/api/figgy/setup#separator',
      }

      // Auto-generate plural and method-like variations
      const shortcuts: Record<string, string> = {}
      for (const [key, url] of Object.entries(baseShortcuts)) {
        shortcuts[key] = url
        shortcuts[key + 's'] = url
        shortcuts['.' + key + '()'] = url
      }

      // Add all your existing static ones here
      Object.assign(shortcuts, {
        // types
        'Real': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Overview/Data_Types.htm',
        'Bool': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Overview/Data_Types.htm',
        'String': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Strings/Strings.htm',
        'Array': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Overview/Arrays.htm',
        'Struct': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Overview/Structs.htm',
        'Undefined': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Overview/Data_Types.htm',
        'Noone': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Overview/Instance%20Keywords/noone.htm',
        'Enum': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Overview/Variables/Constants.htm#:~:text=of%20this%20page.-,Enums,-An%20enum%20is',
        
        // assets
        'Asset.GMRoom': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Rooms/Rooms.htm',
        'Asset.GMObject': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Objects/Objects.htm',
        'Asset.GMSprite': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Sprites/Sprites.htm',
        'Asset.GMTileset': 'https://manual.gamemaker.io/monthly/en/Quick_Start_Guide/Creating_Tile_Sets.htm',
        'Asset.GMSequence': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Sequences/Sequences.htm',

        // IDs
        'Id.Layer': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Rooms/General_Layer_Functions/General_Layer_Functions.htm',
        'Id.Tilemap': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Rooms/Tile_Map_Layers/Tile_Map_Layers.htm',
        'Id.Instance': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Instances/Instances.htm',
        'Id.Function': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Overview/Script_Functions.htm',
        'Id.Background': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Asset_Management/Rooms/Background_Layers/Background_Layers.htm',

        // constants
        'Constant.Color': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Drawing/Colour_And_Alpha/Colour_And_Alpha.htm',
        
        // links
        'New Issue': 'https://github.com/glebtsereteli/Figgy/issues/new',
        'Debug Overlay': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/The_Debug_Overlay.htm',
        'DBG View': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_view.htm',
        'DBG Section': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_section.htm',
        'DBG Slider': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_slider.htm',
        'DBG Slider Int': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_slider_int.htm',
        'DBG Checkbox': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_checkbox.htm',
        'DBG Button': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_button.htm',
        'DBG Dropdown': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_drop_down.htm',
        'DBG Color': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_colour.htm',
        'DBG Text Input': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_text_input.htm',
        'DBG Text Separator': 'https://manual.gamemaker.io/monthly/en/GameMaker_Language/GML_Reference/Debugging/dbg_text_separator.htm',

        // shortcuts
        'Interface': '/pages/home/interface/interface',
        'Persistence': '/pages/home/persistence',
        'Demos': '/pages/home/demos',
        'FAQ': '/pages/home/faq',
        'Figgy': '/pages/api/figgy/overview',
        'Setup': '/pages/api/figgy/setup',
        'Scope Widgets': '/pages/api/figgy/setup#scope-widgets',
        'Scope Widget': '/pages/api/figgy/setup#scope-widgets',
        'Scope': '/pages/api/figgy/setup#scope-widgets',
        'Value Widgets': '/pages/api/figgy/setup#value-widgets',
        'Value Widget': '/pages/api/figgy/setup#value-widgets',
        'Value': '/pages/api/figgy/setup#value-widgets',
        'Decor Widgets': '/pages/api/figgy/setup#decor-widgets',
        'Decor': '/pages/api/figgy/setup#decor-widgets',
        'OnChange': '/pages/api/figgy/setup#onchange',
        '.OnChangeSet()': '/pages/api/figgy/setup#onchangeset',
        '.OnChangeReset()': '/pages/api/figgy/setup#onchangereset',
        '.NoScope()': '/pages/api/figgy/setup#noscope',
        'Getters': '/pages/api/figgy/getters',
        '.GetCurrent()': '/pages/api/figgy/getters#getcurrent',
        '.GetInitial()': '/pages/api/figgy/getters#getinitial',
        '.GetDefault()': '/pages/api/figgy/getters#getdefault',
        'Resetters': '/pages/api/figgy/resetters',
        '.ResetToInitial()': '/pages/api/figgy/resetters#resettoinitial',
        '.ResetToDefault()': '/pages/api/figgy/resetters#resettodefault',
        'Input/Output': '/pages/api/figgy/inputOutput',
        '.Import()': '/pages/api/figgy/inputOutput#import',
        '.Export()': '/pages/api/figgy/inputOutput#export',

        // config
        'FIGGY_DEBUG': '/pages/api/config#figgy-debug',
        'FIGGY_BUILD_INTERFACE': '/pages/api/config#figgy-build-interface',
        'FIGGY_REMOVE_SPACES': '/pages/api/config#figgy-remove-spaces',
        
        'FIGGY_FILE_NAME': '/pages/api/config#figgy-file-name',
        'FIGGY_FILE_EXT': '/pages/api/config#figgy-file-ext',
        'FIGGY_FILE_DELTA': '/pages/api/config#figgy-file-delta',
        'FIGGY_FILE_PRETTIFY': '/pages/api/config#figgy-file-prettify',
        'FIGGY_FILE_OBFUSCATE': '/pages/api/config#figgy-file-obfuscate',
        
        'FIGGY_WINDOW_NAME': '/pages/api/config#figgy-window-name',
        'FIGGY_WINDOW_DEFAULT_START_VISIBLE': '/pages/api/config#figgy-window-default-start-visible',
        'FIGGY_WINDOW_DEFAULT_X': '/pages/api/config#figgy-window-default-x',
        'FIGGY_WINDOW_DEFAULT_Y': '/pages/api/config#figgy-window-default-y',
        'FIGGY_WINDOW_DEFAULT_WIDTH': '/pages/api/config#figgy-window-default-width',
        'FIGGY_WINDOW_DEFAULT_HEIGHT': '/pages/api/config#figgy-window-default-height',
        'FIGGY_CONTROLS_NAME': '/pages/api/config#figgy-controls-name',
        'FIGGY_CONTROLS_OPEN': '/pages/api/config#figgy-controls-open',
        'FIGGY_CONTROLS_IN_EVERY_WINDOW': '/pages/api/config#figgy-controls-in-every-window',
        
        'FIGGY_SECTION_DEFAULT_OPEN': '/pages/api/config#figgy-section-default-open',
        'FIGGY_GROUP_DEFAULT_ALIGN': '/pages/api/config#figgy-group-default-align',
        'FIGGY_UNSCOPED_NAME_FORMAT': '/pages/api/config#figgy-unscoped-name-format',

        'FIGGY_INT_DEFAULT_STEP': '/pages/api/config#figgy-int-default-step',
        'FIGGY_FLOAT_DEFAULT_STEP': '/pages/api/config#figgy-float-default-step',
        
        'FIGGY_BUTTON_DEFAULT_SAME_LINE': '/pages/api/config#figgy-button-default-same-line',
        'FIGGY_SEPARATOR_DEFAULT_ALIGN': '/pages/api/config#figgy-separator-default-align',

        'FIGGY_CHANGES_ENABLED': '/pages/api/config#figgy-changes-enabled',
        'FIGGY_CHANGES_DEFAULT_CALLBACK': '/pages/api/config#figgy-changes-default-callback',
      })
      
      // Markdown-it rule
      md.inline.ruler.before('link', 'shortcuts', (state, silent) => {
        for (const key in shortcuts) {
          const tokenText = `:${key}:`
          if (state.src.startsWith(tokenText, state.pos)) {
            if (!silent) {
              const token = state.push('link_open', 'a', 1)
              token.attrs = [['href', shortcuts[key]]]
              state.push('text', '', 0).content = key
              state.push('link_close', 'a', -1)
            }
            state.pos += tokenText.length
            return true
          }
        }
        return false
      })
    }
  },
})
