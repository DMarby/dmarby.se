<template>
  <header>
    <div class="navbar row no-gutter">
      <div class="col pad-sm text-center">
        <h1>
          <a href="/" class="home-link">{{ siteTitle }}</a>
          <a class="blog-link" href="/blog">Blog</a>
        </h1>
      </div>
    </div>
	</header>
</template>

<script>
export default {
  computed: {
    siteTitle() {
      return this.$siteConfig.title
    }
  }
}
</script>

<style scoped>
  .navbar {
    margin-top: 1vh;
  }

  h1 {
    font-size: 1.75rem;
  }

  .home-link {
    padding-right: 1.5vh;
    border-right: #000 1px solid;
  }

  .blog-link {
    margin-left: 0.5vh;
  }
</style>
