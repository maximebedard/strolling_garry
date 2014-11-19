angular.module('myApp.pathControllers', ['templates'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider
    .when('/paths/:id', {
      templateUrl: 'path.html',
      controller: 'PathCtrl'
    });
}])

.controller('PathCtrl', ['$scope', '$log', '$routeParams', '$location', '$modal', '$timeout', 'Path', 'Branch', 'Waypoint',
  function($scope, $log, $routeParams, $location, $modal, $timeout, Path, Branch, Waypoint) {

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

    // Add path types
    $scope.pathTypes = [
      { name:'Delivery', value:'delivery' },
      { name:'Marketing', value:'marketing' }
    ];

    // Add branches
    Branch.query().then(function(branches){
      $scope.branches = branches;
    });

    // Path display mode
    $scope.isCollapsed = true;

    // Create new or update
    if($routeParams.id === 'new'){
      $scope.path = new Path();
    }
    else{
      Path.get({id:$routeParams.id}).then(function(path){
        $scope.path = path;
        $log.log(path);
      });
    }

    // Markers
    $scope.myMarkers = [];

    $scope.mapOptions = {
      center: new google.maps.LatLng(45.536482, -73.592702),
      zoom: 10,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    $scope.infoWindowOptions = {
      maxHeight: 300
    };

    // Hack to enable datepicker toggle
    // see openDatePicker
    $scope.date = {};


    $scope.addAlert = function() {
      $scope.alerts.push({msg: 'Another alert!'});
    };

    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };


    $scope.addMarker = function($event, $params) {

      var waypoint = new Waypoint({
        latitude: $params[0].latLng.lat(),
        longitude: $params[0].latLng.lng(),
      });

      var marker = new google.maps.Marker({
        map: $scope.myMap,
        position: $params[0].latLng
      });

      $scope.myMarkers.push(marker);

      // 2 ways association
      waypoint.marker = marker;
      marker.waypoint = waypoint;

      $log.log(waypoint);

    };

    $scope.loadMarker = function(){
      // TODO load existing markers
    }

    $scope.openMarkerInfo = function(marker) {

      $log.log(marker);
      $scope.currentMarker = marker;
      $scope.currentMarkerLat = marker.getPosition().lat();
      $scope.currentMarkerLng = marker.getPosition().lng();
      $scope.myInfoWindow.open($scope.myMap, marker);
      offsetCenter($scope.myMap, marker.getPosition(), 0, -200);
    };

    $scope.closeInfoMarkerWindow = function(){
      $scope.myInfoWindow.close();
    }

    // Path toolbar operations
    $scope.savePath = function() {
      $scope.path.save().then(function(path){
        $location.path('/paths/' + path.id);
      })
    }

    $scope.createPath = function() {
      $location.path('/paths/new');
    }

    $scope.loadPath = function() {
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
      $scope.path.date = new Date();
    };

    $scope.clear = function () {
      $scope.path.date = null;
    };

    $scope.toggleMin = function() {
      $scope.minDate = $scope.minDate ? null : new Date();
    };
    $scope.toggleMin();

    $scope.openDatePicker = function($event, obj) {
      $event.preventDefault();
      $event.stopPropagation();
      $scope.date[obj] = !$scope.date[obj];
    };

    $scope.dateOptions = {
      formatYear: 'yy',
      startingDay: 1
    };

  }
])

.controller('PathsCtrl', ['$scope', '$log', '$modalInstance', '$location', 'Path', 'currentPathIsDirty', 'currentPathId',
  function($scope, $log, $modalInstance, $location, Path, currentPathIsDirty, currentPathId){

    $scope.setSelectedPathId = function(pathId){
      if($scope.selectedPathId === pathId){
        $scope.selectedPathId = null;
        return;
      }

      $scope.selectedPathId = pathId;
    }

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

    Path.query().then(function(paths){
      $scope.paths = paths;

      // TODO check this
      $scope.setSelectedPathId(currentPathId);
    });
    $scope.currentPathIsDirty = currentPathIsDirty;
  }
])
