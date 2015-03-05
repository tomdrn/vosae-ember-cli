`import DS from 'ember-data'`

###
  Adds support of type array to `DS.Model` attr.
  @class ArrayTransform
  @module Transform
  @namespace DS
###

ArrayTransform = DS.Transform.extend
  serialize: (serialized) ->
    if Em.isArray serialized
      return serialized
    return []

  deserialize: (deserialized) ->
    if Em.isArray deserialized
      return deserialized
    return []

`export default ArrayTransform`
