angular.module('whaler.controllers').controller 'ImageController', [
  '$scope',
  '$http',
  ($scope, $http) ->
    console.log 'la'
    $http.get('http://localhost:3000/images.json').success((data, status, headers, config) ->
      $scope.values = data
      console.log data
    ).error (data, status, headers, config) ->
      console.log data
]