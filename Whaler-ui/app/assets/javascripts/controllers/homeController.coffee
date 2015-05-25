angular.module('whaler.controllers').controller 'HomeController', [
  '$scope',
  '$http',
  ($scope, $http) ->
    $http.get('http://localhost:3000/home/index.json').success((data, status, headers, config) ->
      $scope.values = data
      console.log data
    ).error (data, status, headers, config) ->
      console.log data
]