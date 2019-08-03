<template>
  <div class="uploads" id="drag-file" @mouseover="dropFile">
    <p>Drag your file here</p>
  </div>
</template>
  
<script>
import { all } from 'q';
export default {
  name:'dragAndDrop',
  methods:{
    dropFile(){
      var holder = document.getElementById('drag-file');

        holder.ondragover = () => {
            return false;
        };

        holder.ondragleave = () => {
            return false;
        };

        holder.ondragend = () => {
            return false;
        };

        holder.ondrop = (e) => {
            e.preventDefault();

            for (let f of e.dataTransfer.files) {
                const pathSplit = f.path.split('.')
                const Extension = pathSplit.pop()
                const validExtesions = ['mkv', 'avi', 'mp4']
              if (validExtesions.includes(Extension)){
                console.log(f.path)
                sendMessageToJulia(f.path)
                alert("File uploaded")
              } else {
                alert("The file is not a video file.\n Allowed formats: mkv, avi, mp4")
              }
            }
            
            return false;
        };
    }
  }
}
</script>

<style scoped>
  .uploads{
    margin: auto;
    width: 40%;
  }
  #drag-file {
        display: flex;
        float: left;
        background-color: rgb(97, 138, 155);
        color:white;
        text-align: center;
        width:300px;
        height:300px;
        margin-left: 30px;
        padding: 40px;
        border-radius: 2%;
        border: 1px solid rgb(84, 82, 82);
    }
</style>

