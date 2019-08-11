<template>
  <Wrap :page="page">
    <div class="container">
      <div class="row">
        <div class="col pad-xl">
          <slot name="default"/>

          <div class="text-center list">
            <p class="text-bold" v-for="post in page.posts" :key="post.permalink">
              <saber-link :to="post.permalink">{{ post.title }}</saber-link>
              <time :datetime="dateTime(page.createdAt)">{{ formatDate(page.createdAt) }}</time>
            </p>
          </div>

          <div class="text-center">
            <div class="row">
              <div v-if="page.pagination.hasPrev" class="col">
                <router-link :to="page.pagination.prevLink">
                  ← Previous
                </router-link>
              </div>
              <div v-if="page.pagination.hasNext" class="col">
                <router-link :to="page.pagination.nextLink">
                  Next →
                </router-link>
              </div>
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
    Wrap,
  },
  props: ['page'],
  methods: {
    formatDate,
    dateTime
  }
}
</script>

<style scoped>
.list {
  margin-bottom: 5vh;
}

.list p {
  font-size: 1.5rem;
}

.list a {
  padding-right: 1.5vh;
  border-right: #000 1px solid;
}

.list time {
  margin-left: 0.5vh;
  color: #777;
  font-size: 1.5rem;
}
</style>
