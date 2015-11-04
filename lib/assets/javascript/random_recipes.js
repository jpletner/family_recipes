$(document).ready(function() {

var jaxit = function(param){
    var domElement = $("#tag_" + param + "_title");
    var domElement2 = $("#tag_" + param + "_ingredients");
    var domElement3 = $("#tag_" + param + "_image");
    var interval = setInterval(resetPic, 5000);

    $.ajax({
      dataType: 'json',
      url: '/recipes/get_random_recipe',
      success: function(data){
        domElement.html(data.title);
        domElement2.html(data.ingredients);
        domElement3.html("<img src='" + data.image + "'/>");
      },
      error: function(){
        domElement.html("No response.  The server may be down.");
      }
    });

    function resetPic() {
       $.ajax({
         dataType: 'json',
         url: '/recipes/get_random_recipe',
         success: function(data){
           domElement.html(data.title);
           domElement2.html(data.ingredients);
           domElement3.html("<img src='" + data.image + "'/>");
         },
         error: function(){
           domElement.html("No response.  The server may be down.");
         }
       });
    };
  }; // end jaxit

// Loop Through Tag Gallery Windows
  for (i = 1; i < 5; i++) {
    jaxit(i);
  };

});
