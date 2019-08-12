<template>
  <Wrap :page="page">
    <div class="row no-gutter">
       <div class="col-12 col-md-6 content">
        <slot name="default"/>
      </div>

      <div class="col-12 col-md-6 image">
        <saber-image
          :src=page.assets.background
          :lazy="{
            placeholder: true,
            lazyLoad: true,
            blendIn: true
          }"
        />
      </div>
    </div>
  </Wrap>
</template>

<script>
import Wrap from '../components/Wrap.vue'

export default {
  components: {
    Wrap
  },
  props: ['page']
}
</script>

<style scoped>
.content {
  height: 100vh;
  padding-top: 15vh;
  display: flex;
  justify-content: center;
}

.content {
  padding-right: 5vh !important;
  padding-left: 5vh !important;
}

@custom-media --breakpoint-sm-down only screen and (max-width: 767px);
@media (--breakpoint-sm-down) {
  .content {
    margin-bottom: 10vh;
  }
}

.image {
  height: 100vh;
}

.image img {
  height: 100vh;
  width: 100%;
  object-fit: cover;
  object-position: 50% 5%;
}
</style>
