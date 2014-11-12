'use strict';

angular.module('myApp.controllers', ['templates'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/paths/:id', {
      templateUrl: 'path.html',
      controller: 'PathCtrl'
    });
}])

.controller('PathCtrl', ['$scope', '$log', '$routeParams', '$location', '$modal', 'Path',
  function($scope, $log, $routeParams, $location, $modal, Path) {

    if($routeParams.id === 'new')
      $scope.path = new Path();
    else
      $scope.path = Path.get({ id:$routeParams.id });

    $scope.save = function() {
      $log.log($scope.path);
      if($routeParams.id === 'new') {
        $scope.path.$save(function(path){
          $location.path('/paths/' + path.id);
        });
      }
      else
        $scope.path.$update();
    }

    $scope.create = function() {
      $location.path('/paths/new');
    }

    $scope.load = function() {

      var modalInstance = $modal.open({
      templateUrl: 'paths.html',
      controller: 'PathsCtrl',
      size: 'lg',
      resolve: {
          selectedPath: function () {
            return $scope.path;
          }
        }
      });

      modalInstance.result.then(function (selectedItem) {
        $scope.selected = selectedItem;
      }, function () {
        $log.info('Modal dismissed at: ' + new Date());
      });

    }

    $scope.isCollapsed = true;

    $('.path_details_content').perfectScrollbar();

    /*
    $scope.onWaypointDropComplete = function (index, obj, evt) {
      var otherObj = $scope.waypoints[index];
      var otherIndex = $scope.waypoints.indexOf(obj);
      $scope.waypoints[index] = obj;
      $scope.waypoints[otherIndex] = otherObj;
    }

    $scope.onClientDropComplete = function (index, obj, evt) {
      var otherObj = $scope.clients[index];
      var otherIndex = $scope.clients.indexOf(obj);
      $scope.clients[index] = obj;
      $scope.clients[otherIndex] = otherObj;
    }
    */

  }
])

.controller('PathsCtrl', ['$scope', '$log', '$modalInstance', 'Path',
  function($scope, $log, $modalInstance, Path){

    $scope.paths = Path.query();

    $scope.close = function(){
      $modalInstance.dismiss('cancel');
    }

    $scope.delete = function(path){
      path.$delete();
      $scope.paths.splice($scope.paths.indexOf(path), 1)
    }

  }
])



.controller('MainCtrl', ['$scope', '$log',
  function($scope, $log, $modal){

    $scope.map = {
      center: {
        latitude: 45.536482,
        longitude: -73.592702
      },
      zoom: 8
    };

  }
])

.controller('ClientCtrl',['$scope', function(){

}])

.controller('ClientsCtrl', ['$scope', '$modalInstance',
  function($scope, $modalInstance){


    $scope.close = function(){
      $modalInstance.dismiss('cancel');
    }

  }
]);
