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

  $scope.markers = [];
    $scope.path.markers = [];


    // Setup the map
    $scope.map = {
      center: { latitude: 45.536482, longitude: -73.592702 },
      zoom: 10,
      events: {
        click: function(event) {
          // Add marker to the map
          $log.log(event.latLng);

          $scope.markers.push({id:0, options:{ draggable:true }, coords:{latitude:event.latLng().lat(), longitude: event.latLng().lng()}});
          $log.log($scope.markers);

        }
      }
    };

    //var infoWindow = new google.maps.InfoWindow({
    //  maxWidth:600
    //});

    //google.maps.event.addListener(Map.getMap(), 'click', function(event) {
    //  $scope.addMarker(event.latLng, $scope.markerType);
    //});

    //$scope.addMarker = function(location, markerType){

      //$log.log('adding ' + markerType);

      //var markerInfo = new Waypoint();
      //markerInfo.type = markerType
      //markerInfo.longitude = location.lng();
      //markerInfo.latitude = location.lat();

      //var marker = new google.maps.Marker({
      //  position: location,
      //  map: Map.getMap(),
      //  draggable: true
      //});


      //google.maps.event.addListener(marker, 'click',
      //  (function(marker, scope, markerInfo) {
      //    return function(){

      //      scope.markerInfo = markerInfo;
      //      scope.infoWindow = infoWindow;

      //      var content = $templateCache.get(markerInfo.type + '.html');
      //      var compiled = $compile(content)($scope);

      //      //scope.$apply();

      //      infoWindow.setOptions({content: compiled[0].innerHTML});
      //      infoWindow.open(Map.getMap(), marker);

      //    }
      //  })(marker, $scope, markerInfo)
      //);
    //}

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

.controller('MarkerCtrl', ['$log', '$scope', function($log, $scope){

  $log.log($scope.markerInfo);

  $scope.close = function(){
    $log.log('closing');
  }

  $scope.save = function(){
    $log.log('save');
  }
}])

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
