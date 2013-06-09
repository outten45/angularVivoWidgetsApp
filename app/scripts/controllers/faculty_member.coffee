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
    resultSuccess = (data, status) ->
      $scope.facultyMember = data

    $scope.loadFacultyMember = () ->
      $http.jsonp(url()).success(resultSuccess)

    $scope.loadFacultyMember()


  ]
