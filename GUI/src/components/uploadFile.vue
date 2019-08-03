<template>
  <div class="uploads">
      <div id="drag-file">
        <p>Drag your files here</p>
      </div>
      <a id="SelectFileButton">Or upload a file from here</a>
      <select-from-dialog v-on:click="SelectFromDialog" ></select-from-dialog>
    </div>
</template>

<script>
export default {
  name: 'uploadFile',
  props: {
  
  },
  methods: {
      SelectFromDialog() {
        //Filesystem module
        const fs = require("fs")
        //Dialogs module
        const { dialog } = require("electron").remote;
  
        dialog.showOpenDialog({
          properties:['openFile'],
          filters: [
           { name: 'Movies', extensions: ['mkv', 'avi', 'mp4'] },
          ]
        }, (file) => {
          if(file === undefined) {
            console.log('No file was selected')
            return;
          }
          const filePath = file[0]
          Blink.msg("press", filePath)
          alert("File uploaded")
        })
      }
  }
}
</script>

<style scoped>
.uploads{
  margin: auto;
  width: 50%;
}
#drag-file {
      background-color: rgb(97, 138, 155);
      color:white;
      text-align: center;
      width:300px;
      height:300px;
      margin: 10px;
      padding: 40px;
  }
  a {
    margin: 20px;
    color: rgba(4, 116, 164, 0.673);
  }
  a:hover{
    cursor: pointer;
    color: white;
  }
</style>
