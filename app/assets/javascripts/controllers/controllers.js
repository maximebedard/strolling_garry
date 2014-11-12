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
          currentPathId: function () {
            return $scope.path.id;
          }
        }
      });

      modalInstance.result.then(
        function (selectedPathId) {
          //$log.log(selectedPathId);
          //$location.path('/path/' + selectedPathId);

          //if(!$scope.$$phase) $scope.$apply()
        },
        function () {
          $log.info('Modal dismissed at: ' + new Date());
        });

    }

    $scope.isCollapsed = true;







    $scope.today = function() {
      $scope.dt = new Date();
    }
    $scope.today();

    $scope.clear = function () {
      $scope.dt = null;
    }

    // Disable weekend selection
    $scope.disabled = function(date, mode) {
      return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
    }

    $scope.toggleMin = function() {
      $scope.minDate = $scope.minDate ? null : new Date();
    }
    $scope.toggleMin();

    $scope.open = function($event) {
      $event.preventDefault();
      $event.stopPropagation();
      $scope.opened = true;
    }

    $('.path_details_wrapper > .scrollpane').perfectScrollbar();
    $('#branch').selectize({
      create: true,
      sortField: 'text'
    });
    $('#path_type').selectize({
      create: true,
      sortField: 'text'
    });


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

.controller('PathsCtrl', ['$scope', '$log', '$modalInstance', 'Path', 'currentPathId',
  function($scope, $log, $modalInstance, Path, currentPathId){

    $scope.paths = Path.query();

    $scope.setSelectedPathId = function(pathId){
      if($scope.selectedPathId === pathId){
        $scope.selectedPathId = null;
        return;
      }

      $scope.selectedPathId = pathId;
    }
    $scope.setSelectedPathId(currentPathId);

    $scope.create = function(){
      // close the dialog and send null will redirect to new
      $modalInstance.close('new');
    }

    $scope.load = function(pathId) {
      // close the dialog and send the selected path
      //$modalInstance.close(pathId);
      
    }

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
      zoom: 11
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
