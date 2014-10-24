'use strict';

angular.module('myApp.controllers', ['ngRoute', 'templates'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/paths/:id', {
      templateUrl: 'path.html',
      controller: 'PathCtrl'
    });
}])

.controller('PathCtrl', ['$scope', '$log',
  function($scope,$log) {

    $scope.name = "My Path";
    $scope.clients = [];
    $scope.waypoints = [];
    $scope.isCollapsed = true;

    for(var i = 0; i < 25; i++) {
      $scope.clients[i] = { name : "client " + i};
      $scope.waypoints[i] = { name : "waypoints " + i };
    }

    $('.path_details_content').perfectScrollbar();

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


  }
])

.controller('PathsCtrl', ['$scope', '$log', '$modalInstance', 'Path',
  function($scope, $log, $modalInstance, Path){

    $scope.paths = Path.query();

    $scope.close = function(){
      $modalInstance.dismiss('cancel');
    }

    $scope.edit = function(path){

    }

    $scope.create = function() {

    }

    $scope.delete = function(path) {
      path.$delete();
      $scope.paths.splice($scope.paths.indexOf(path), 1)
    }

  }
])



.controller('MainCtrl', ['$scope', '$log', '$modal',
  function($scope, $log, $modal){
    $scope.map = {
      center: {
        latitude: 45.536482,
        longitude: -73.592702
      },
      zoom: 8
    };


    $scope.showPaths = function() {
      var modalInstance = $modal.open({
      templateUrl: 'paths.html',
      controller: 'PathsCtrl',
      size: 'lg',
      resolve: {
          items: function () {
            return $scope.items;
          }
        }
      });

      modalInstance.result.then(function (selectedItem) {
        $scope.selected = selectedItem;
      }, function () {
        $log.info('Modal dismissed at: ' + new Date());
      });

    }

    $scope.showClients = function() {
      var modalInstance = $modal.open({
      templateUrl: 'clients.html',
      controller: 'ClientsCtrl',
      size: 'lg',
      resolve: {
          items: function () {
            return $scope.items;
          }
        }
      });

      modalInstance.result.then(function (selectedItem) {
        $scope.selected = selectedItem;
      }, function () {
        $log.info('Modal dismissed at: ' + new Date());
      });

    }


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
