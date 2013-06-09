'use strict';

angular.module('angularVivoWidgetsApp')
  .directive('preventClick', () ->
    (scope, element, attrs) ->
      element.bind 'click', (event) ->
        event.preventDefault()
  )
