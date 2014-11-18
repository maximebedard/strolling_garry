angular.module('myApp.services', ['ngResource'])

.factory('Path', ['$resource', function($resource) {
  return $resource('/api/paths/:id', {id: '@id'}, {update: {method:'PUT'}});
}])

.factory('Client', ['$resource', function($resource) {
  return $resource('/api/clients/:id', {id: '@id'}, {update: {method:'PUT'}});
}])

.factory('Waypoint', ['$resource', function($resource) {
  return $resource('/api/waypoints/:id', {id: '@id'}, {update: {method:'PUT'}});
}])

.factory('Branch', ['$resource', function($resource) {
  return $resource('/api/branches/:id', {id: '@id'}, {update: {method:'PUT'}});
}]);
