<template>
  <div>
    <b-carousel
      id="carousel-1"
      v-model="slide"
      :interval="2000"
      controls
      indicators
      background="#ababab"
      img-width="1024"
      img-height="480"
      style="text-shadow: 1px 1px 2px #333;"
      @sliding-start="onSlideStart"
      @sliding-end="onSlideEnd"
    >
      <!-- Text slides with image -->
      <b-carousel-slide v-for="(movie, i) in datas" :key="i"
        :caption="movie.title"
        :text="movie.release_date"
        :img-src="movie.poster_path"
      ></b-carousel-slide>

    </b-carousel>

    <!-- <p class="mt-4">
      Slide #: {{ slide }}<br>
      Sliding: {{ sliding }}
    </p> -->
  </div>
</template>

<script>
import axios from 'axios';

  export default {
    data() {
      return {
        slide: 0,
        sliding: null,
        datas: []
      }
    },
    created() {
      axios.get('https://b18tn4uogi.execute-api.ap-northeast-2.amazonaws.com/dev/popular_data')
          .then(res => {this.datas = res.data.data})
          },
    methods: {
      onSlideStart() {
        this.sliding = true
      },
      onSlideEnd() {
        this.sliding = false
      }
    }
  }
</script>


<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>