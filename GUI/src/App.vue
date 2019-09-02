<template>
  <div id="app" >
    <div v-if="!fileUpload" class="file_upload">
      <h1>Video Linter</h1>
      <p>Welcome to Video Linter! <br> Upload your video file and the linter will check for bad frames like black frames or silent ones</p>
      <p>There are 2 options to upload a file:</p>
      <dragAndDrop @file-uploaded="updateFile"/>
      <openDialog @file-uploaded="updateFile"/>
    </div>

    <div v-if="fileUpload && !resultsReady" class="loading">
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
      <h1>Results</h1>
      <button id="reset-button" @click="resetResults">Upload another file</button>
      <div v-if="!results.black[0] && !results.focus[0]">We did not found any bad frames <br> Your video is perfect!</div>
      <div v-if="results.black[0] || results.focus[0]">
        <p>We found bad frames:</p>

        <span v-if="results.black[0]">Black frames:</span>
        <ul class="frames-list">
          <li v-for="value in results.black" v-bind:key="value">
            {{ value }}, 
          </li>
        </ul>

        <span v-if="results.focus[0]">Out of focus:</span>
        <ul class="frames-list">
          <li v-for="value in results.focus" v-bind:key="value">
            {{ value }}, 
          </li>
        </ul>
        </div>
    </div>
    
  </div>
</template>

<script>
import openDialog from './components/openDialog'
import dragAndDrop from './components/dargAndDrop'
import progressBar from './components/progressBar'
import { PixelSpinner } from 'epic-spinners'

export default {
  name: 'app',
  components: {
    dragAndDrop,
    openDialog,
    progressBar,
    PixelSpinner,
  },
  data(){
    return {
      fileUpload: false,
      progressPercentage: 0,
      results:{},
      resultsReady: false,
    }
  },
  methods: {
    updateFile(){
      return this.fileUpload = true
    },
    resetResults(event){
      this.fileUpload = false
      this.progressPercentage = 0,
      this.results = {},
      this.resultsReady = false
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

#reset-button {
  background-color: rgb(102, 143, 208);
  text-align: center;
  margin: 20px;
  height: auto;
  --offset: 10px;
  --border-size: 2px;
  padding: 1.5em 3em ;
	border: 0;
  color: black;
  letter-spacing: .25em;
  font-size: 14px;
	outline: none;
	cursor: pointer;
	border-radius: 5px;
	box-shadow: inset 0 0 0 var(--border-size) currentcolor;
  transition: background .8s ease;
}

#reset-button:hover {
  background-color: #2D5BA3;
  color: white;
  margin: 20px;
  border: 1px solid rgb(26, 54, 99);
  transition:800ms ease all;
	font-weight: bold;
}

.frames-list {
  margin-right: 25px;
}
.frames-list  li {
  display: inline;
  list-style: none;
}
</style>
