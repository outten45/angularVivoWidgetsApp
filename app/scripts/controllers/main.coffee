'use strict';

angular.module('angularVivoWidgetsApp')
  .controller 'MainCtrl', ['$scope', '$http', '$routeParams', '$location', 'CurrentFaculty', ($scope, $http, $routeParams, $location, CurrentFaculty) ->

    # setup showing of the json
    showingOrgJson = false
    $scope.showOrgJson = (v) ->
      showingOrgJson = v
    $scope.isShowingOrgJson = () ->
      showingOrgJson


    orgId = if $routeParams.orgId? then $routeParams.orgId else "org50000936"
    setupOrg = () ->
      if $scope.faculty.length > 0
        $scope.organizationName = $scope.faculty[0].attributes.organizationName
      if $scope.organizationUri?
        match = /(org(\d)+)$/.exec($scope.organizationUri)
        # console.log("match: " + match[0] + "\n" + match[1])
        orgId = match[0] if match[0]?

    $scope.organizationUri = "https://scholars.duke.edu/individual/#{orgId}"

    url = () ->
      "https://scholars.duke.edu/widgets/api/v0.9/organizations/people/all.jsonp?" +
      "uri=#{$scope.organizationUri}&callback=JSON_CALLBACK"

    # setup and load faculty
    $scope.faculty = []
    resultSuccess = (data, status) ->
        $scope.faculty = data
        setupOrg()

    $scope.loadOrgFaculty = () ->
      $http.jsonp(url()).success(resultSuccess)

    $scope.loadOrgFaculty()

    $scope.goToOrg = () ->
      setupOrg()
      $location.path("/orgs/#{orgId}")

    $scope.organizationName = ""

    $scope.currentPerson = CurrentFaculty.person
    $scope.setCurrentPerson = (p) ->
      $scope.currentPerson = p

      match = /(([a-zA-z0-9])+)$/.exec(p.uri)
      # console.log("person match: " + match[0] + "\n" + match[1])
      personId = match[0] if match[0]?

      $location.path("/faculty/#{personId}")
      false

  ]
