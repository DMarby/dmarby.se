module.exports = {
  siteConfig: {
    title: 'David Marby',
    description: 'David Marby - Full-Stack Engineer',
    lang: 'en',
    // Used for the rss feed
    author: 'David Marby',
    url: 'https://dmarby.se/',
    email: 'david@dmarby.se',
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
        ],
        markdownImages: false // Disable to fix rss feeds
      }
    },
    {
      resolve: 'saber-plugin-medium-zoom',
      options: {
        selector: '.zoomable'
      }
    },
    {
      resolve: 'saber-plugin-google-analytics',
      options: {
        trackId: 'UA-29191316-1',
        anonymizeIp: true,
      }
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
