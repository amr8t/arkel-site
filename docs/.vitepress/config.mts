import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'Arkel',
  description: 'Community Owned Object Storage',
  lang: 'en-US',
  cleanUrls: true,
  base: '/',

  head: [
    ['link', { rel: 'icon', href: '/favicon.svg', type: 'image/svg+xml' }],
  ],

  themeConfig: {
    logo: '/logo.svg',
    siteTitle: false,

    nav: [
      { text: 'Quick start', link: '/quickstart' },
      { text: 'CLI', link: '/cli' },
      { text: 'Roadmap', link: '/roadmap' },
      { text: 'Discord', link: 'https://discord.gg/f4pBspUqy' },
    ],

    sidebar: [
      {
        text: 'Getting started',
        items: [
          { text: 'Introduction', link: '/introduction' },
          { text: 'Quick start', link: '/quickstart' },
          { text: 'FAQ', link: '/faq' },
        ],
      },

      {
        text: 'Architecture',
        items: [{ text: 'Overview', link: '/architecture/overview' }],
      },
      {
        text: 'The network',
        items: [
          { text: 'Contribute', link: '/contribute' },
          { text: 'Roadmap', link: '/roadmap' },
        ],
      },
      {
        text: 'Reference',
        items: [
          { text: 'CLI reference', link: '/cli' },
          { text: 'Configuration', link: '/config' },
        ],
      },
      {
        text: 'Community',
        items: [
          { text: 'Discord', link: 'https://discord.gg/f4pBspUqy' },
          { text: 'GitHub', link: 'https://github.com/amr8t/arkelstore' },
        ],
      },
    ],

    search: {
      provider: 'local',
      options: {
        translations: {
          button: { buttonText: 'Search docs', buttonAriaLabel: 'Search docs' },
        },
      },
    },

    outline: { label: 'On this page', level: [2, 3] },

    footer: {
      message: '',
      copyright: 'Copyright © 2026 Arkel',
    },

    socialLinks: [{ icon: 'github', link: 'https://github.com/amr8t/arkel' }],
  },
})
