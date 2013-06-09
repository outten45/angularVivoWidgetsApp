'use strict'

describe 'Controller: FacultyMemberCtrl', () ->

  # load the controller's module
  beforeEach module 'angularVivoWidgetsApp'

  FacultyMemberCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    FacultyMemberCtrl = $controller 'FacultyMemberCtrl', {
      $scope: scope
    }

  it 'should attach a list of awesomeThings to the scope', () ->
    expect(scope.awesomeThings.length).toBe 3;
