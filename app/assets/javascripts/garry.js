
'use strict';

$('body').tooltip({
  selector: '[data-toggle=tooltip]',
  container: 'body'
});

function initCall() {
  console.log('Google maps api initialized.');
  angular.bootstrap(document.getElementById('body'), ['doc.ui-map']);
}

// Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngDraggable',
  'ngResource',
  'ngRoute',
  'ui.bootstrap',
  'ui.map',
  'templates',
  'myApp.controllers',
  'myApp.services',
  'myApp.pathControllers'
])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.otherwise({redirectTo: '/paths/new'});
}]);
