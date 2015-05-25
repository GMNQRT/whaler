angular.module('whaler', [
  'ngRoute'
  'ngResource'
  'ngCookies'
  'templates'
  'whaler.filters'
  'whaler.services'
  'whaler.factories'
  'whaler.directives'
  'whaler.controllers'
])
.value('version', '1.0')
.config([
  '$routeProvider'
  '$locationProvider'
  '$resourceProvider'
  '$httpProvider'
  ($routeProvider, $locationProvider, $resourceProvider, $httpProvider) ->
    $routeProvider.when '/',
      templateUrl: '/home'
      controller: 'HomeController'
    $routeProvider.when '/images',
      templateUrl: '/images'
      controller: 'ImageController'
    $routeProvider.when '/container',
      templateUrl: '/container'
      controller: 'ContainerController'
    $routeProvider.otherwise '/'

    $resourceProvider.defaults.stripTrailingSlashes = true
    $locationProvider.html5Mode(false).hashPrefix('!')
    return
])
.run(['$rootScope', '$route', '$location', ($rootScope, $route, $location) ->
  $location.pushState = (url, params) ->
    angular.extend $route.current.pathParams, params
    $location.path(url);

  $rootScope.$on '$routeChangeSuccess', (ev, data) ->
    $rootScope.controller = data.controller.toLowerCase().replace(/controller/, 'Ctrl') if data.controller?

])

angular.module 'whaler.filters', []
angular.module 'whaler.services', []
angular.module 'whaler.directives', []
angular.module 'whaler.controllers', []
angular.module 'whaler.factories', []
