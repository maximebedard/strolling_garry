//angular.module('myApp.services', ['ngResource'])
//
//.factory('Path', ['$resource', function($resource) {
//  return $resource('/api/paths/:id', {id: '@id'}, {update: {method:'PUT'}});
//}])
//
//.factory('Client', ['$resource', function($resource) {
//  return $resource('/api/clients/:id', {id: '@id'}, {update: {method:'PUT'}});
//}])
//
//.factory('Waypoint', ['$resource', function($resource) {
//  return $resource('/api/waypoints/:id', {id: '@id'}, {update: {method:'PUT'}});
//}])
//
//.factory('Branch', ['$resource', function($resource) {
//  return $resource('/api/branches/:id', {id: '@id'}, {update: {method:'PUT'}});
//}]);
angular.module('myApp.services', ['rails'])

.factory('Path', ['railsResourceFactory', 'railsSerializer', function (railsResourceFactory, railsSerializer) {
  return railsResourceFactory({
    url: '/api/paths',
    name: 'path',
    serializer: railsSerializer(function(){
      this.nestedAttribute('waypoints');
      this.resource('waypoints', 'Waypoint');
      this.exclude('created_at', 'id', 'updated_at', 'user_id', 'clients', 'branch')
    })
  });
}])



.factory('Waypoint', ['railsResourceFactory', 'railsSerializer', function (railsResourceFactory, railsSerializer) {
  return railsResourceFactory({
    url: '/api/waypoints',
    name: 'waypoint',
    serializer: railsSerializer(function(){
      this.exclude('created_at','updated_at','user_id', 'path_id', 'marker');
    })
  });
}])




.factory('Branch', ['railsResourceFactory', function (railsResourceFactory) {
  return railsResourceFactory({
    url: '/api/branches',
    name: 'branch'
  });
}]);
