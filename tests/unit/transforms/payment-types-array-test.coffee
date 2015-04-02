`import { test, moduleFor } from 'ember-qunit'`
`import vosaeSettings from 'vosae/conf/settings'`

moduleFor 'transform:payment-types-array', {
  # Specify the other units that are required for this test.
  # needs: ['serializer:foo']
}

test 'it exists', (assert) ->
  transform = @subject()
  assert.ok transform

test 'method - deserialize', ->
  expect(3)
  transform = @subject()

  deserialized = transform.deserialize("string")
  deepEqual deserialized, [], "deserialize method should return an empty array if initial data isn't an array"

  deserialized = transform.deserialize(null)
  deepEqual deserialized, [], "deserialize method should return an empty array if initial data isn't an array"

  deserialized = transform.deserialize(['CASH', 'CREDIT_CARD'])
  expected = []
  expected.addObject(vosaeSettings.paymentTypes.findProperty('value', 'CASH'))
  expected.addObject(vosaeSettings.paymentTypes.findProperty('value', 'CREDIT_CARD'))
  deepEqual deserialized, expected, "deserialize method should return an array with related payment type objects"

test 'method - serialize', ->
  expect(3)
  transform = @subject()

  serialized = transform.serialize("a string")
  deepEqual serialized, [], "serialize method should return an empty array if initial data isn't an array"

  serialized = transform.serialize(null)
  deepEqual serialized, [], "serialize method should return an empty array if initial data isn't an array"


  deserialized = []
  deserialized.addObject(vosaeSettings.paymentTypes.findProperty('value', 'CASH'))
  deserialized.addObject(vosaeSettings.paymentTypes.findProperty('value', 'CREDIT_CARD'))
  serialized = transform.serialize(deserialized)
  deepEqual serialized, ['CASH', 'CREDIT_CARD'], "serialize method should return an array of string containing payment types value"
