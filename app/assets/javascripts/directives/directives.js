angular.module('myApp.directives', [])

.directive("selectize", [function() {
  return {
    restrict: "A",
    link: function(scope, elem, attrs) {
      $(elem).selectize({ create: true, sortField: 'text' });
    }
  }
}])

.directive("perfectScrollbar", [function() {
  return {
    restrict: "A",
    link: function(scope, elem, attrs) {
      $(elem).perfectScrollbar();
    }
  }
}])
