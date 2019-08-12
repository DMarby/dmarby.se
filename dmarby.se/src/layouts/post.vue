<template>
  <Wrap :page="page">
    <div class="container">
      <div class="row">
        <div class="col post-padding">
          <div class="text-center title">
            <h1>{{ page.title }}</h1>
            <time class="text-bold" :datetime="dateTime(page.createdAt)">{{ formatDate(page.createdAt) }}</time>
          </div>

          <div class="post-content">
            <slot name="default" />
          </div>

          <div class="text-center links">
            <div class="row">
              <div v-if="page.prevPost" class="col">
                <router-link :to="page.prevPost.permalink">
                  ← Previous
                </router-link>
              </div>
              <div v-if="page.nextPost" class="col">
                <router-link :to="page.nextPost.permalink">
                  Next →
                </router-link>
              </div>
            </div>

            <div class="comments">
              <h4>Thoughts? Comments?</h4>
              <p>Find me on Twitter <a class="text-bold" href="https://twitter.com/DMarby">@DMarby</a> or <a class="text-bold" href="/">somewhere else</a></p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </Wrap>
</template>

<script>
import Wrap from '../components/Wrap.vue'

import formatDate from '../utils/formatDate'
import dateTime from '../utils/dateTime'

export default {
  components: {
    Wrap
  },
  props: ['page'],
  methods: {
    formatDate,
    dateTime
  }
}
</script>

<style>
/* For some reason this doesn't work in a scoped style */
.post-content a {
  font-family: "Helvetica Neue LT W05 65 Medium";
}

.post-content strong {
  font-family: "Helvetica Neue LT W05 65 Medium";
}
</style>

<style scoped>
.title {
  margin-bottom: 5vh;
}

.title h1 {
  font-size: 4rem;
}

.title time {
  color: #777;
}

.links {
  margin-top: 5vh;
}

.comments {
  margin-top: 3vh;
}
</style>
