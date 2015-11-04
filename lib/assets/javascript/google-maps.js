$(document).ready(function(){
  var coordinates = new google.maps.LatLng(32.7475811,-117.1311596);
  var mapOptions = {
    center: coordinates,
    zoom:15,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var mapContainer = $("#googleMap")[0];
  var map = new google.maps.Map(mapContainer, mapOptions);
});
