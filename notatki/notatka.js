const notes = document.querySelectorAll(".note")
const main = document.querySelector(".container")
const addBtn = document.querySelector("#addFormBtn")
const form = document.querySelector(".formDiv")

let x = window.matchMedia("(min-width: 1350px)")
notes.forEach((note)=>{
    note.addEventListener('click',()=>{
        if(note.classList.contains("note")){
            note.classList.replace("note","bigNote")
            notes.forEach((note)=>{
                if(note.classList.contains("note")){
                    note.style.display = "none";
                }
            })
            if(x.matches){
                form.style.display = "none";
            }else{
                addBtn.style.display = "none";
            }
            setTimeout(()=>{
                main.addEventListener("click",Func)
                function Func(){
                    notes.forEach((note)=>{
                        
                        note.style.display = "block"
                        if(note.classList.contains("bigNote")){
                            note.classList.replace("bigNote","note")

                        }
                        if(!x.matches){
                            addBtn.style.display = "block"
                        }else{
                            form.style.display = "block"
                        }
                    })
                    main.removeEventListener("click",Func)
                }
            },1)
        }

    })
})