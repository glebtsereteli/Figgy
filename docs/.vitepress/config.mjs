import { defineConfig } from 'vitepress'

export default defineConfig({
  title: "Figgy",
  themeConfig: {
    search: {
      provider: 'local'
    },
    
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/pages/home/whatIsFiggy' },
      { text: 'API', link: '/pages/api/overview' },
      { text: 'Releases', link: 'https://github.com/glebtsereteli/Figgy/releases' },
    ],
    
    outline: [2, 3],
    sidebar: [
      {
        text: 'Home',
        collapsed: false,
        items: [
          { text: 'What is Figgy?', link: '/pages/home/whatIsFiggy' },
          { text: 'Getting Started', link: '/pages/home/gettingStarted' },
          { text: 'Workflow', link: '/pages/home/workflow' },
          { text: 'FAQ', link: '/pages/home/faq' },
        ]
      },
      {
        text: 'API',
        collapsed: false,
        items: [
          { text: 'Overview', link: '/pages/api/overview' },
          {
            text: "Setup",
            items:[
              { 
                text: 'Scope Widgets',
                collapsed: true,
                link: '/pages/api/scopeWidgets',
                items: [
                  { text: "Window", link: '/pages/api/scopeWidgets/#window'},
                  { text: "Section", link: '/pages/api/scopeWidgets/#section'},
                  { text: "Group", link: '/pages/api/scopeWidgets/#group'},
                ],
              },
              { 
                text: 'Value Widgets',
                collapsed: true,
                link: '/pages/api/valueWidgets',
                items: [
                  { text: "Int", link: '/pages/api/valueWidgets/#int'},
                  { text: "Float", link: '/pages/api/valueWidgets/#float'},
                  { text: "Bool", link: '/pages/api/valueWidgets/#bool'},
                  { text: "Text", link: '/pages/api/valueWidgets/#text'},
                  { text: "Multi", link: '/pages/api/valueWidgets/#multi'},
                  { text: "Color", link: '/pages/api/valueWidgets/#color'},
                ],
              },
              { 
                text: 'Decor Widgets',
                collapsed: true,
                link: '/pages/api/decorWidgets',
                items: [
                  { text: "Button", link: '/pages/api/decorWidgets/#button'},
                  { text: "Comment", link: '/pages/api/decorWidgets/#comment'},
                  { text: "Separator", link: '/pages/api/decorWidgets/#separator'},
                ],
              },
              { text: 'OnChange', link: '/pages/api/onChange' },
            ]
          },
          {
            text: "Control",
            items: [
              { text: 'Input/Output', link: '/pages/api/io' },
              { text: 'Reset', link: '/pages/api/reset' },
              { text: 'Getters', link: '/pages/api/getters' },
            ]
          },
          { text: 'Configuration', link: '/pages/api/config' },
        ]
      },
      {
        text: "Others",
        collapsed: false,
        items:[
          { text: 'Alternatives', link: '/pages/others/alternatives' },
          { text: 'Credits', link: '/pages/others/credits' },
        ],
      }
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/glebtsereteli/Figgy' },
    ],

    footer: {
      message: 'Released under the <a href="https://github.com/glebtsereteli/Figgy/blob/main/LICENSE">MIT License</a>. Built with <a href="https://vitepress.dev/">VitePress</a>.',
      copyright: 'Copyright © 2025 <a href="https://github.com/glebtsereteli">Gleb Tsereteli</a>'
    },
  }
})
