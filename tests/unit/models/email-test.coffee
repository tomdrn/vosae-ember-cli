`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'email', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'method - getErrors', ->
  expect(2)
  store = @store()

  Em.run ->
    email = store.createRecord 'email'
    equal email.getErrors().length, 1, "the getErrors method should return an array with 1 error"

    email.set 'email', 'thomas@email.com'
    equal email.getErrors().length, 0, "the getErrors method should return an empty array"

test 'property - type', ->
  expect(1)
  store = @store()

  Em.run ->
    email = store.createRecord 'email', {id: 1}
    equal email.get('type'), 'WORK', "type default value should be 'WORK'"

test 'computedProperty - displayType', ->
  expect(2)
  store = @store()

  Em.run ->
    email = store.createRecord 'email', {id: 1}
    equal email.get('displayType'), 'Work', "the displayType property should return 'Work'"

    email.set 'type', 'fakeValue'
    equal email.get('displayType'), '', "the displayType property should return an empty string"
