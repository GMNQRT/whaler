angular.module('whaler', [
  'ngRoute'
  'ngResource'
  'ngCookies'
  'templates'
  'whaler.filters'
  'whaler.provider'
  'whaler.services'
  'whaler.factories'
  'whaler.directives'
  'whaler.controllers'
  'whaler.interceptors'
])
.config([
  '$routeProvider'
  '$locationProvider'
  '$resourceProvider'
  '$httpProvider'
  'APIProvider'
  ($routeProvider, $locationProvider, $resourceProvider, $httpProvider, APIProvider) ->
    $routeProvider.when '/',
      templateUrl: '/partials/home'
      controller: 'HomeController'
      controllerAs: 'ctrl'
      action: 'getInfo'

    $routeProvider.when '/images',
      templateUrl: '/partials/images'
      controller: 'ImageController'
      controllerAs: 'ctrl'

    $routeProvider.when '/container',
      templateUrl: '/partials/containers'
      controller: 'ContainerController'
      controllerAs: 'ctrl'

    $routeProvider.when '/container/:id',
      templateUrl: '/partials/containers/show'
      controller: 'ContainerController'
      controllerAs: 'ctrl'
      action: 'show'

    $routeProvider.when '/container/:id/start',
      templateUrl: '/partials/containers'
      controller: 'ContainerController'
      controllerAs: 'ctrl'
      action: 'start'

    $routeProvider.when '/container/:id/stop',
      templateUrl: '/partials/containers'
      controller: 'ContainerController'
      controllerAs: 'ctrl'
      action: 'stop'

    $routeProvider.when '/container/:id/pause',
      templateUrl: '/partials/containers'
      controller: 'ContainerController'
      controllerAs: 'ctrl'
      action: 'pause'

    $routeProvider.when '/container/:id/unpause',
      templateUrl: '/partials/containers'
      controller: 'ContainerController'
      controllerAs: 'ctrl'
      action: 'unpause'

    $routeProvider.when '/container/:id/restart',
      templateUrl: '/partials/containers'
      controller: 'ContainerController'
      controllerAs: 'ctrl'
      action: 'restart'

    $routeProvider.when '/container/:id/delete',
      templateUrl: '/partials/containers'
      controller: 'ContainerController'
      controllerAs: 'ctrl'
      action: 'delete'

    $routeProvider.when '/login',
      templateUrl: '/partials/users/sign_in'
      controller: 'SessionsController'
      controllerAs: 'ctrl'
      action: 'showForm'

    $routeProvider.when '/signout',
      templateUrl: '/partials/users/sign_in'
      controller: 'SessionsController'
      controllerAs: 'ctrl'
      action: 'signout'

    $routeProvider.otherwise '/'


    APIProvider.scheme('http').url('localhost').port('3000')
    $resourceProvider.defaults.stripTrailingSlashes = true
    $locationProvider.html5Mode(true).hashPrefix('!')
    return
])
.run(['$rootScope', '$route', '$location', ($rootScope, $route, $location) ->
  $location.pushState = (url, params) ->
    angular.extend $route.current.pathParams, params
    $location.path(url);

  $rootScope.$on '$routeChangeSuccess', (ev, data) ->
    $rootScope.controller = data.controller.toLowerCase().replace(/controller/, 'Ctrl') if data.controller?

  $rootScope.$on '$viewContentLoaded', (event) ->
    if $route.current.controllerAs and $route.current.action
      if $route.current.scope[$route.current.controllerAs][$route.current.action]
        $route.current.scope[$route.current.controllerAs][$route.current.action]()
      else
        throw "Undefined action '#{$route.current.action}'' on controller '#{$route.current.controllerAs}'"
])

angular.module 'whaler.filters', []
angular.module 'whaler.services', []
angular.module 'whaler.directives', []
angular.module 'whaler.controllers', []
angular.module 'whaler.factories', []
angular.module 'whaler.provider', []
angular.module 'whaler.interceptors', []
