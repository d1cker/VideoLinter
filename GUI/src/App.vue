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
        <pixel-spinner
          :animation-duration="2000"
          :size="200"
          color="#0c1765"
        />
        <p>Analizing file...</p>
    </div>
    
  </div>
</template>

<script>
import openDialog from './components/openDialog'
import dragAndDrop from './components/dargAndDrop'
import { FingerprintSpinner } from 'epic-spinners'
import { PixelSpinner } from 'epic-spinners'

export default {
  name: 'app',
  components: {
    dragAndDrop,
    openDialog,
    FingerprintSpinner,
    PixelSpinner
  },
  data(){
    return {
      fileUpload: false,
      dataReady: false
    }
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
</style>
