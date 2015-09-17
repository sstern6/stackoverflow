$(document).ready(function() {

  $("#new_comment_form").hide();

  $(".fa").on("click", function(event){
    event.preventDefault();
    var question_id = $(".questions").attr("id")
    var answer_id = $(this).parents(".vote").attr("id");
    var votes = $(this).next().html();
    var url = "/questions/" + answer_id + "/vote";
    console.log(url);


    var updated_votes = Number(votes) + 1 // vote_change

    // Event delagation TODO: make every vote work
    $.ajax({
      method: "POST",
      url: url,
    })
    .done(function(response){
      console.log(response);
      $("div#"+answer_id).find(".vote-count").html(updated_votes);
    })
    .fail(function(){
      console.log("This failed");
    });


  });

  $('button').on("click",function(event){
    event.preventDefault();
    $('#new_comment_form').show();
  });

  $('#new_comment_form').submit(function(event){
    event.preventDefault();

    var questionId = $("input[name=question_id]").val();
    // var content = tinyMCE.get('editor').getContent();
    var content = $(this).serialize();
    console.log(content);

    $.ajax({
      method:"POST",
      url:"/comments",
      dataType:"json",
      data: content
    })

    .done(function(response){
        console.log(response);
    })

    .fail(function(){
      console.log("FAIL")
    })


  });








});
