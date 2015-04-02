`import { test, moduleFor } from 'ember-qunit'`

moduleFor 'transform:array', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

test 'it exists', (assert) ->
  transform = @subject()
  assert.ok transform

test 'method deserialize should always return an array', ->
  transform = @subject()

  deserialized = transform.deserialize("a string")
  deepEqual deserialized, [], "deserialize method should return an empty array if initial data isn't an array"

  deserialized = transform.deserialize(["1", "2"])
  deepEqual deserialized, ["1", "2"], "deserialize method should return initial data array"

test 'method serialize should always return an array', ->
  transform = @subject()

  serialized = transform.serialize("a string")
  deepEqual serialized, [], "serialize method should return an empty array if initial data isn't an array"

  serialized = transform.serialize(["1", "2"])
  deepEqual serialized, ["1", "2"], "serialize method should return initial data array"
