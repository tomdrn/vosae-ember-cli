`import DS from 'ember-data'`

###
  Adds support of type array to `DS.Model` attr.
  @class ArrayTransform
  @module Transform
  @namespace DS
###

ArrayTransform = DS.Transform.extend
  serialize: (serialized) ->
    console.log('okiii')
    if Em.typeOf(serialized) is 'array'
      return serialized
    return []

  deserialize: (deserialized) ->
    console.log('okiii')
    if Em.typeOf(deserialized) is 'array'
      return deserialized
    return []

`export default ArrayTransform`
