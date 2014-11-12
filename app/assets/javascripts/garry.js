
'use strict';

$('body').tooltip({
  selector: '[data-toggle=tooltip]',
  container: 'body'
});

// Declare app level module which depends on views, and components
angular.module('myApp', [
  'google-maps'.ns(),
  'ngDraggable',
  'ngResource',
  'ngRoute',
  'ui.bootstrap',
  'templates',
  'myApp.controllers',
  'myApp.services'
])

.config(['GoogleMapApiProvider'.ns(),
  function (GoogleMapApi) {
    GoogleMapApi.configure({
        key: 'AIzaSyD28wyczXQXdz2WOEi7lI46-BAGiMidNb0',
        v: '3.17',
        libraries: 'weather,geometry,visualization'
    });
  }
])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.otherwise({redirectTo: '/paths/new'});
}]);
