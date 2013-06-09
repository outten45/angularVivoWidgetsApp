'use strict'

describe 'Directive: preventClick', () ->
  beforeEach module 'angularVivoWidgetsApp'

  element = {}

  it 'should make hidden element visible', inject ($rootScope, $compile) ->
    element = angular.element '<prevent-click></prevent-click>'
    element = $compile(element) $rootScope
    expect(element.text()).toBe 'this is the preventClick directive'
