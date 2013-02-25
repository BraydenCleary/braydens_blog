$(document).ready(function() {
  $('#new-post').submit(function(e) {

    e.preventDefault();


    $.ajax({
      type: this.method,
      url: this.action,
      data: $(this).serialize(),
      dataType: 'json',
      success: function(data, status, xhr){
        $('.post-list').prepend("Title: <a href=/posts/" + data.post.id + ">" + data.post.title + "</a><li> Created just now </li><li><a href=/posts/" + data.post.id + "/like>Like this post!</a><li>Likes:" + data.post.like_count + "</li><br/>")
        $('#new-post .clear-input').val('')
        $('#new-post textarea').val('')
        debugger
      }
    })
  });
});



        
