'use strict';

angular.module('angularVivoWidgetsApp')
  .filter 'truncate', [() ->
    (input, length) ->
      length = 10 unless length?
      input = "" unless input?

      if input.length <= length
        input
      else
        String(input).substring(0, length) + "..."

  ]
