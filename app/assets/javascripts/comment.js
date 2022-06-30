document.querySelectorAll(".reply").forEach(element => {
    element.addEventListener("click",(e)=>{
        e.preventDefault();
        element.nextElementSibling.style= "display:block;"
    })
});