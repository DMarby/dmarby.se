<template>
  <div>
    <Navbar v-if="showHeader"/>
    <slot></slot>
  </div>
</template>

<script>
import Navbar from '../components/Navbar.vue'
import variables from 'saber/variables'

export default {
  components: {
    Navbar
  },

  props: ['page'],

  head () {
    const { excerpt } = this.page
    const { title, layout } = this.page
    let { description } = this.$siteConfig
    if (layout === 'page' || layout === 'post') {
      if (excerpt) {
        description = excerpt.replace(/<(?:.|\n)*?>/gm, '')
      }
    }
    let pageTitle = title ? `${title} | ${this.$siteConfig.title}` : this.$siteConfig.title

    return {
      title: pageTitle,
      meta: [
        description && {
          name: 'description',
          content: description
        },
        {
          property: 'og:title',
          content: pageTitle
        },
        {
          property: 'og:description',
          content: description
        },
        {
          property: 'og:type',
          content: 'website'
        },
        {
          property: 'og:url',
          content: this.page.attributes.absoluteURL
        },
        {
          name: 'robots',
          content: 'index, follow'
        }
      ].filter(Boolean),
      link: this.$feed
        ? [
            {
              rel: 'alternate',
              title: `${this.$siteConfig.title} - Feed`,
              type: `application/${
                this.$feed.type === 'atom'
                  ? 'atom+xml'
                  : this.$feed.type === 'rss'
                  ? 'rss+xml'
                  : 'json'
              }`,
              href: this.$feed.permalink
            },
            {
              rel: 'canonical',
              href: this.page.attributes.absoluteURL
            }
          ].filter(Boolean)
        : []
    }
  },

  computed: {
    showHeader() {
      const { layout } = this.page
      return layout !== 'index'
    }
  }
}
</script>
