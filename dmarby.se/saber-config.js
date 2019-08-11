module.exports = {
  siteConfig: {
    title: 'David Marby',
    description: 'David Marby - Full-Stack Engineer',
    lang: 'en',
    // Used for the rss feed
    author: 'David Marby',
    url: 'https://dmarby.se'
  },
  theme: './src',
  permalinks: {
    post: '/blog/:slug/',
    page: '/:slug/'
  },
  themeConfig: {},
  plugins: [
    {
      resolve: 'saber-plugin-image',
      options: {
        sizes: [
          1000,
          800,
          500,
        ]
      }
    },
    {
      resolve: 'saber-plugin-medium-zoom',
      options: {
        selector: '[data-zoomable]'
      }
    },
    {
      resolve: './src/packages/saber-plugin-google-analytics',
      options: { trackId: 'UA-29191316-1' }
    },
    {
      resolve: 'saber-plugin-query-posts',
      options: {
        perPage: 20
      }
    },
    {
      resolve: 'saber-plugin-feed',
      options: {
        atomFeed: 'blog/atom.xml'
      }
    },
  ],
  markdown: {
    plugins: [
      {
        resolve: 'markdown-it-attrs'
      }
    ]
  }
}
