<template>
  <div>
    <h1>David Marby</h1>
    <div class="subtitle">
      <h2>Full-Stack Engineer</h2>
      <h2>Infrastructure Lead at <a href="https://mullvad.net">Mullvad</a></h2>
    </div>

    <div class="row no-gutter blog">
      <div class="col-12">
        <h4>Blog</h4>
        <p v-for="post in page.posts" :key="post.permalink">
          <saber-link :to="post.permalink">{{ post.title }}</saber-link>
        </p>
        <p class="text-bold">
          <saber-link
            :to="$saber.getPageLink('./blog.md')"
          >Read all posts</saber-link>
        </p>
      </div>

      <div class="col-6 links">
        <h4>Social</h4>
        <p><a href="mailto:david@dmarby.se">Email</a></p>
        <p><a href="https://twitter.com/DMarby">Twitter</a></p>
        <p><a href="https://github.com/DMarby">Github</a></p>
      </div>

      <div class="col-6 links">
        <h4>Projects</h4>
        <p><a href="https://picsum.photos">Lorem Picsum</a></p>
      </div>
    </div>
  </div>
</template>

<script>
export const attributes = {
  layout: 'index',
  injectAllPosts: {
    perPage: 3,
    firstPageOnly: true,
  },
  assets: {
    background: '../images/background.jpg'
  }
}

export default {
  props: ['page'],
}
</script>

<style scoped>
p {
  margin-bottom: 0rem;
}

h1 {
  font-size: 6rem;
}

h4 {
  margin-bottom: 1rem;
}

.subtitle {
  margin-top: 3vh;
}

.blog {
  margin-top: 12vh;
}

.links {
  margin-top: 5vh;
  padding-right: 5.5vh;
}
</style>
