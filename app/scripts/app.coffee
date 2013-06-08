'use strict';

angular.module('angularVivoWidgetsApp', [])
  .config ['$routeProvider', ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'

      .when '/orgs/:orgId',
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'

      .otherwise
        redirectTo: '/'

  ]
