function test(){
    console.log("game")
    $.ajax({
        type: "POST",
        url: "/posts/searchpost",
        data: { post: { title:  $("#searchInput").val()} },
       
      })
}