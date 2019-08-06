<template>
  <div class="uploads">
    <form>
      <label for="chooseFile"> Choose file to upload from your computer </label>
      <input type="file" id="chooseFile" @change="FileSelected" accept="video/*">
    </form>
  </div>
</template>
  
<script>
export default {
  name:'openDialog',
  methods:{
    FileSelected(event) {
      const file = event.target.files[0].path
      console.log(file)
      sendMessageToJulia(file)
      alert("File uploaded")
      this.$emit('file-uploaded')
    }
  }
}
</script>

<style scoped>
  
  .uploads{
    display: flex;
    float: right;
    margin: auto;
    width: 40%;
  }
 input[type="file"]{
   display: none;
 }
  form {
  width: 350px;
  margin: auto 0 ;
  margin-right: 30px;

}
form label{
  background-color: #7F9CCB;
  padding: 5px 10px;
  border-radius: 3px;
  font-size: 0.8rem;
  height: auto;
  border: 1px solid rgb(84, 82, 82);
}

form label:hover {
  background-color: #2D5BA3;
  color: white;
}

form label:active {
  background-color: #0D3F8F;
  color: white;
}
</style>

