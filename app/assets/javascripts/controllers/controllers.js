'use strict';

angular.module('myApp.controllers', ['templates'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/paths/:id', {
      templateUrl: 'path.html',
      controller: 'PathCtrl'
    });
}])

.controller('PathCtrl', ['$scope', '$log', '$routeParams', '$location', 'Path',
  function($scope, $log, $routeParams, $location, Path) {

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

.controller('PathsCtrl', ['$scope', '$log', 'Path',
  function($scope, $log, Path){

    $scope.paths = Path.query();

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
