<template>
  <div id="app">
    <h1>Video Linter</h1>
    <p>Welcome to Video Linter! <br> Upload your video file and the linter will check for bad frames like black frames or silent ones</p>
    <p>There are 2 options to upload a file:</p>
    <dragAndDrop />
    <openDialog />
  </div>
</template>

<script>
import openDialog from './components/openDialog'
import dragAndDrop from './components/dargAndDrop'

export default {
  name: 'app',
  components: {
    dragAndDrop,
    openDialog
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Kanit:800&display=swap');

body{
  margin:auto;
  background-color: rgba(114, 186, 249, 0.845);
}
#app {
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
</style>
