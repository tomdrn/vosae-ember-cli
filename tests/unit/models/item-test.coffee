`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'item', {
  # Specify the other units that are required for this test.
  needs: [
    'model:currency'
    'model:tax'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - displayUnitPrice', ->
  expect(3)
  store = @store()

  Em.run ->
    item = store.createRecord 'item', {id: 1}
    equal item.get('displayUnitPrice'), undefined, "displayUnitPrice should return undefined without unit price"

    item.set 'unitPrice', 15.46
    equal item.get('displayUnitPrice'), "15.46", "displayUnitPrice should format unit price"

    item.set 'unitPrice', 15.460564545
    equal item.get('displayUnitPrice'), "15.46", "displayUnitPrice should round unit price"

test 'property - displayType', ->
  expect(2)
  store = @store()

  Em.run ->
    item = store.createRecord 'item', {id: 1, type: "PRODUCT"}
    equal item.get('displayType'), "Product", "displayType should return the item type"

    item.set 'type', "SERVICE"
    equal item.get('displayType'), "Service", "displayType should return the item type"

test 'method - recordIsEmpty', ->
  expect(2)
  store = @store()

  Em.run ->
    item = store.createRecord 'item', {id: 1}
    equal item.recordIsEmpty(), true, "recordIsEmpty should return true if item is empty"

    item.set("reference", "Book")
    equal item.recordIsEmpty(), false, "recordIsEmpty should return false if item is not empty"
