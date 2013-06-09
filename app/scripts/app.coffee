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

      .when '/faculty/:facultyId',
        templateUrl: 'views/faculty_member.html',
        controller: 'FacultyMemberCtrl'

      .otherwise
        redirectTo: '/'

  ]
