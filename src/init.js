
function initBody() { 
  const body = document.querySelector("body")
  const uploads = document.createElement("div")
  uploads.classList.add("uploads")

  const dragAndDrop = document.createElement("div")
  dragAndDrop.id = "drag-file"

  const p = document.createElement("p")
  p.innerHTML = "Drag your files here"

  dragAndDrop.appendChild(p)
  uploads.appendChild(dragAndDrop)

  const a = document.createElement("a")
  a.id = "SelectFileButton"
  a.innerHTML = "Or upload a file from here"

  uploads.appendChild(a)

  body.appendChild(uploads)

   //Filesystem module
   const fs = require("fs")
   //Dialogs module
   const { dialog } = require("electron").remote;

   document.getElementById("SelectFileButton").addEventListener("click", () => {
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
   }, false)

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
          Blink.msg("press", f.path)
            alert("File uploaded")
        }
        
        return false;
    };

}