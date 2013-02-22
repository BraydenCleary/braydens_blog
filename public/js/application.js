$(document).ready(function() {
  $('.create-post').submit(function(e) {
    e.preventDefault();

    var postData = $(this).serialize();

    console.log(postData)
    //$.post('/posts', function(data) {
      //('.post-list').after(data);

    //});
  });
});


