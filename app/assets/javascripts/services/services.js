angular.module('myApp.services', ['ngResource'])

.factory('Path', ['$resource', function($resource) {
  return $resource('/api/paths/:id', {id: '@id'}, {update: {method:'PUT'}});
}])

.factory('Client', ['$resource', function($resource) {
  return $resource('/api/clients/:id', {id: '@id'}, {update: {method:'PUT'}});
}])

.factory('Waypoint', ['$resource', function($resource) {
  return $resource('/api/waypoints/:id', {id: '@id'}, {update: {method:'PUT'}});
}]);

//.factory('Map', [function(){
//
//
//  var mapContainer = $("#map")[0],
//  mapOptions = {
//    center: { lat: 45.536482, lng: -73.592702},
//    zoom: 11
//  },
//  directionService = new google.maps.DirectionsService()
//
//  var map = new google.maps.Map(mapContainer, mapOptions);
//
//  return {
//    getMap: function(){ return map; },
//    getDirectionService: function() { return directionService; }
//  }
//
//}]);
