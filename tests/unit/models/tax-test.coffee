`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'tax', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - rate', ->
  expect(1)
  store = @store()

  Em.run ->
    tax = store.createRecord "tax", {}
    equal tax.get('rate'), 0.00, "rate should be equal 0.00 by default"

test 'computed property - displayRate', ->
  expect(1)
  store = @store()

  Em.run ->
    tax = store.createRecord "tax", {name: "TVA", rate: 0.196}
    equal tax.get('displayRate'), "19.60%", "displayRate should format the tax rate"

test 'computed property - displayTax', ->
  expect(1)
  store = @store()

  Em.run ->
    tax = store.createRecord "tax", {name: "TVA", rate: 0.196}
    equal tax.get('displayTax'), "TVA 19.60%", "displayTax should concat tax name and rate"
