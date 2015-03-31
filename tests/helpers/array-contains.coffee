`import Ember from 'ember'`

arrayContains = (array, element, message) ->
  notEqual $.inArray(element, array), -1, message

`export default arrayContains`
