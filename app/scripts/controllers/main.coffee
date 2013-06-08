'use strict';

angular.module('angularVivoWidgetsApp')
  .controller 'MainCtrl', ['$scope', '$http', '$routeParams', '$location', ($scope, $http, $routeParams, $location) ->

    # setup showing of the json
    showingOrgJson = false
    $scope.showOrgJson = (v) ->
      showingOrgJson = v
    $scope.isShowingOrgJson = () ->
      showingOrgJson



    orgId = if $routeParams.orgId? then $routeParams.orgId else "org50000936"
    setOrgId = () ->
      if $scope.organizationUri?
        match = /(org(\d)+)$/.exec($scope.organizationUri)
        console.log("match: " + match[0] + "\n" + match[1])
        orgId = match[0] if match[0]?

    $scope.organizationUri = "https://scholars.duke.edu/individual/#{orgId}"

    url = () ->
      "https://scholars.duke.edu/widgets/api/v0.9/organizations/people/all.jsonp?" +
      "uri=#{$scope.organizationUri}&callback=JSON_CALLBACK"

    # setup and load faculty
    $scope.faculty = []
    resultSuccess = (data, status) ->
        # console.log(data)
        $scope.faculty = data
        setOrgId()
    $scope.loadOrgFaculty = () ->
      # alert('mode it')
      console.log(url())
      $http.jsonp(url()).success(resultSuccess)
      # alert('nothing again')

    $scope.loadOrgFaculty()

    $scope.goToOrg = () ->
      setOrgId()
      $location.path("/orgs/#{orgId}")

  ]
