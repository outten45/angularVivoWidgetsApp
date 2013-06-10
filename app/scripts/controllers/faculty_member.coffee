'use strict'

angular.module('angularVivoWidgetsApp')
  .controller 'FacultyMemberCtrl', ['$scope', '$http', '$routeParams', 'CurrentFaculty', ($scope, $http, $routeParams, CurrentFaculty) ->

    # setup showing of the json
    showingFacultyJson = false
    $scope.showFacultyJson = (v) ->
      showingFacultyJson = v
    $scope.isShowingFacultyJson = () ->
      showingFacultyJson

    facultyId = if $routeParams.facultyId?
      $routeParams.facultyId
    else
      ""

    $scope.facultyUri = "https://scholars.duke.edu/individual/#{facultyId}"

    url = () ->
      "https://scholars.duke.edu/widgets/api/v0.9/people/complete/all.jsonp?" +
      "uri=#{$scope.facultyUri}&callback=JSON_CALLBACK"

    $scope.facultyMember = {}
    $scope.facultyMemberJson = {}
    resultSuccess = (data, status) ->
      $scope.facultyMember = data
      $scope.facultyMemberJson = data

    $scope.loadFacultyMember = () ->
      $http.jsonp(url()).success(resultSuccess)

    $scope.loadFacultyMember()

    $scope.showJsonFor = (type) ->
      # console.log "!!!>>>> showing for #{type}"
      data = if type == "all" then $scope.facultyMember else $scope.facultyMember[type]
      $scope.facultyMemberJson = data


    $scope.showingArea = $routeParams.tab
    $scope.showingArea ?= 'publications'
    $scope.showArea = (area) ->
      $scope.showingArea = area
    $scope.isShowingArea = (area) ->
      $scope.showingArea is area


  ]
