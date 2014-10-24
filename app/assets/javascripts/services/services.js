angular.module('myApp.services', ['ngResource'])

.factory('Path', ['$resource', function($resource) {
  return $resource('/api/paths/:id', {id: '@id'}, {update: {method:'PUT'}});
}])

.factory('Client', ['$resource', function($resource) {
  return $resource('/api/clients/:id', {id: '@id'}, {update: {method:'PUT'}});
}]);
