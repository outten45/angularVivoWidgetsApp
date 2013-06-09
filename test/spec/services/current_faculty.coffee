'use strict'

describe 'Service: currentFaculty', () ->

  # load the service's module
  beforeEach module 'angularVivoWidgetsApp'

  # instantiate service
  currentFaculty = {}
  beforeEach inject (_currentFaculty_) ->
    currentFaculty = _currentFaculty_

  it 'should do something', () ->
    expect(!!currentFaculty).toBe true;
