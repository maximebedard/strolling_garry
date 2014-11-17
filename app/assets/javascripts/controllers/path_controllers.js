angular.module('myApp.pathControllers', ['templates'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/paths/:id', {
      templateUrl: 'path.html',
      controller: 'PathCtrl'
    });
}])

.controller('PathCtrl', ['$scope', '$log', '$routeParams', '$location', '$modal', 'Path',
  function($scope, $log, $routeParams, $location, $modal, Path) {



    function offsetCenter(map, latlng, offsetx, offsety) {
      var scale = Math.pow(2, map.getZoom());
      var nw = new google.maps.LatLng(
          map.getBounds().getNorthEast().lat(),
          map.getBounds().getSouthWest().lng()
      );

      var worldCoordinateCenter = map.getProjection().fromLatLngToPoint(latlng);
      var pixelOffset = new google.maps.Point((offsetx/scale) || 0,(offsety/scale) ||0)

      var worldCoordinateNewCenter = new google.maps.Point(
          worldCoordinateCenter.x - pixelOffset.x,
          worldCoordinateCenter.y + pixelOffset.y
      );

      var newCenter = map.getProjection().fromPointToLatLng(worldCoordinateNewCenter);

      map.setCenter(newCenter);
    }

    // Default adding mode
    $scope.markerType = 'waypoint';

    // Path display mode
    $scope.isCollapsed = true;

    // Create new or update
    if($routeParams.id === 'new'){
      $scope.path = new Path();
    }
    else{
      $scope.path = Path.get({ id:$routeParams.id });
    }

    $scope.myMarkers = [];

    $scope.mapOptions = {
      center: new google.maps.LatLng(45.536482, -73.592702),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    $scope.infoWindowOptions = {
      maxHeight: 300
    };

    $scope.addMarker = function($event, $params) {
      $scope.myMarkers.push(new google.maps.Marker({
        map: $scope.myMap,
        position: $params[0].latLng
      }));
    };

    $scope.openMarkerInfo = function(marker) {
      $scope.currentMarker = marker;
      $scope.currentMarkerLat = marker.getPosition().lat();
      $scope.currentMarkerLng = marker.getPosition().lng();
      $scope.myInfoWindow.open($scope.myMap, marker);
      offsetCenter($scope.myMap, marker.getPosition(), 0, -100);
    };

    $scope.closeInfoMarkerWindow = function(){
      $scope.myInfoWindow.close();
    }

    // Path toolbar operations
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
      $modal.open({
        templateUrl: 'paths.html',
        controller: 'PathsCtrl',
        size: 'lg',
        resolve: {
            currentPathIsDirty: function(){
              return $scope.pathForm.$dirty;
            },
            currentPathId: function () {
              return $scope.path.id;
            }
          }
        });
    }

    // Path date picker
    $scope.today = function() {
      $scope.dt = new Date();
    }
    $scope.today();

    $scope.clear = function () {
      $scope.dt = null;
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
    $('#branch').selectize({ create: true, sortField: 'text' });
    $('#path_type').selectize({ create: true, sortField: 'text' });

  }
])

.controller('PathsCtrl', ['$scope', '$log', '$modalInstance', '$location', 'Path', 'currentPathIsDirty', 'currentPathId',
  function($scope, $log, $modalInstance, $location, Path, currentPathIsDirty, currentPathId){

    $scope.paths = Path.query();
    $scope.currentPathIsDirty = currentPathIsDirty;

    $scope.setSelectedPathId = function(pathId){
      if($scope.selectedPathId === pathId){
        $scope.selectedPathId = null;
        return;
      }

      $scope.selectedPathId = pathId;
    }
    $scope.setSelectedPathId(currentPathId);

    $scope.create = function(){
      $location.path("/paths/new");
      $modalInstance.close('new');
    }

    $scope.load = function(pathId) {
      $location.path("/paths/" + pathId);
      $modalInstance.close();
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
