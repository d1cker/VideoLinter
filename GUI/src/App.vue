<template>
  <div id="app" >
    <div v-if="!fileUpload" class="file_upload">
      <h1>Video Linter</h1>
      <p>Welcome to Video Linter! <br> Upload your video file and the linter will check for bad frames like black frames or silent ones</p>
      <p>There are 2 options to upload a file:</p>
      <dragAndDrop @file-uploaded="updateFile"/>
      <openDialog @file-uploaded="updateFile"/>
    </div>
    <div v-if="fileUpload" class="loading">
      <div class="spinner">
        <pixel-spinner
          :animation-duration="2000"
          :size="200"
          color="#0c1765"
        />
      </div>
        <p>Analyzing Video...</p>
        <progressBar :percentage="progressPercentage"/>
    </div>
    <div v-if="resultsReady" class="file_results">
      <h1>Ready</h1>
      <div>{{ results }}</div>
      <vue-horizontal-timeline :items="items"/>
    </div>
    
  </div>
</template>

<script>
import openDialog from './components/openDialog'
import dragAndDrop from './components/dargAndDrop'
import progressBar from './components/progressBar'
import { PixelSpinner } from 'epic-spinners'
import { VueHorizontalTimeline } from 'vue-horizontal-timeline'

export default {
  name: 'app',
  components: {
    dragAndDrop,
    openDialog,
    progressBar,
    PixelSpinner,
    VueHorizontalTimeline
  },
  data(){
    return {
      fileUpload: false,
      dataReady: false,
      progressPercentage: 0,
      results: {
        "focus":[43,49,52,57,94,99,107,112,128,139,160,162],
        "black":[46,47,48,49,97,98,99,100,101,148,149,150,151]
        },
      resultsReady: true,
      items:[
        {
        title: 'Title example 1',
        content: 'black'
        },
        {
        title: 'Title example 2',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ex dolor, malesuada luctus scelerisque ac, auctor vitae risus. Vivamus risus dolor, faucibus a bibendum quis, facilisis eget odio.'
        },
        {
        title: 'Title example 3',
        content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut ex dolor, malesuada luctus scelerisque ac, auctor vitae risus. Vivamus risus dolor, faucibus a bibendum quis, facilisis eget odio.'
        },
    ]}
  },
  methods: {
    updateFile(){
      return this.fileUpload = true
    }
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Kanit:800&display=swap');

@import url('https://fonts.googleapis.com/css?family=Blinker&display=swap');

body{
  margin:auto;
  background-color: rgba(114, 186, 249, 0.845);
}
#app {
  display: grid;
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  font-size: 20px;
  font-weight: 600;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  margin:auto;
}
h1 {
  font-family: 'Kanit', sans-serif;
}
.loading {
  margin: auto;
  margin-top: 70px;
}

.loading p {
  font-size: 28px;
  font-family: 'Blinker', sans-serif;
}

.spinner{
  margin: auto;
  width: 50%;

}
</style>
