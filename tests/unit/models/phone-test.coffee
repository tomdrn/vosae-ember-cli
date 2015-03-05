`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'phone', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'method - combinedTypeChanged', ->
  expect(2)
  store = @store()

  Em.run ->
    phone = store.createRecord 'phone'
    phone.combinedTypeChanged 'HOME-FAX'

    equal phone.get('type'), 'HOME', "the type should be HOME"
    equal phone.get('subtype'), 'FAX', "the subtype should be FAX"

test 'method - getErrors', ->
  expect(2)
  store = @store()

  Em.run ->
    phone = store.createRecord 'phone'
    equal phone.getErrors().length, 1, "the getErrors method should return an array with 1 error"

    phone.set 'phone', '304343043'
    equal phone.getErrors().length, 0, "the getErrors method should return an empty array"

test 'computedProperty - typeIsWork', ->
  expect(2)
  store = @store()

  Em.run ->
    phone = store.createRecord 'phone', {type: 'WORK'}
    equal phone.get('typeIsWork'), true, "the typeIsWork property should return true"

    phone.set 'type', 'HOME'
    equal phone.get('typeIsWork'), false, "the typeIsWork property should return false"

test 'computedProperty - typeIsHome', ->
  expect(2)
  store = @store()

  Em.run ->
    phone = store.createRecord 'phone', {type: 'HOME'}
    equal phone.get('typeIsHome'), true, "the typeIsHome property should return true"

    phone.set 'type', 'WORK'
    equal phone.get('typeIsHome'), false, "the typeIsHome property should return false"

test 'computedProperty - combinedType', ->
  expect(2)
  store = @store()

  Em.run ->
    phone = store.createRecord 'phone', {type: 'WORK'}
    equal phone.get('combinedType'), 'WORK', "the combinedType should return WORK"

    phone.set 'subtype', 'CELL'
    equal phone.get('combinedType'), 'WORK-CELL', "the combinedType should return WORK-CELL"

test 'computedProperty - displayCombinedType', ->
  expect(5)
  store = @store()

  Em.run ->
    phone = store.createRecord 'phone', {type: 'WORK'}
    equal phone.get('displayCombinedType'), 'Work', "the displayCombinedType should return Work"

    phone.set 'subtype', 'CELL'
    equal phone.get('displayCombinedType'), 'Work cell', "the displayCombinedType should return Work cell"

    phone.set 'type', null
    equal phone.get('displayCombinedType'), '', "the displayCombinedType should return an empty string"

    phone.set 'subtype', null
    equal phone.get('displayCombinedType'), '', "the displayCombinedType should return an empty string"

    phone.set 'type', 'SomethingShity'
    equal phone.get('displayCombinedType'), '', "the displayCombinedType should return an empty string"

test 'property - type', ->
  expect(1)
  store = @store()

  Em.run ->
    email = store.createRecord 'phone', {id: 1}
    equal email.get('type'), 'WORK', "type default value should be 'WORK'"
