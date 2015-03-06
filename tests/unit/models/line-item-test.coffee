`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'line-item', {
  # Specify the other units that are required for this test.
  needs: [
    'model:tax'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - shouldDisableField', ->
  expect(2)
  store = @store()

  Em.run ->
    lineItem = store.createRecord 'lineItem', {id: 1}
    equal lineItem.get('shouldDisableField'), true, "shouldDisableField should return true if lineItem hasn't reference"

    lineItem.set 'reference', 'book194'
    equal lineItem.get('shouldDisableField'), false, "shouldDisableField should return false if lineItem has a reference"

test 'property - total', ->
  expect(3)
  store = @store()

  Em.run ->
    lineItem = store.createRecord 'lineItem', {id: 1}
    equal lineItem.get('total'), 0, "total should return 0 if there's no unit price and no quantity"

    lineItem.set 'unitPrice', 10
    equal lineItem.get('total'), 0, "total should return 0 if there's no quantity"

    lineItem.set 'quantity', 5
    equal lineItem.get('total'), 50, "total should return unit price multiplied by the quantity"

test 'property - totalPlusTax', ->
  expect(3)
  store = @store()

  Em.run ->
    tax = store.createRecord 'tax', {id: 1, rate: 0.196}
    lineItem = store.createRecord 'lineItem', {id: 1, tax: tax}
    equal lineItem.get('totalPlusTax'), 0, "totalPlusTax should return 0 if there's no unit price and no quantity"

    lineItem.set 'unitPrice', 10.2
    equal lineItem.get('totalPlusTax'), 0, "totalPlusTax should return 0 if there's no quantity"

    lineItem.set 'quantity', 5
    equal lineItem.get('totalPlusTax'), 60.996, "totalPlusTax should return unit price multiplied by the quantity multiplied by the tax"

test 'property - displayTotal', ->
  expect(2)
  store = @store()

  Em.run ->
    lineItem = store.createRecord 'lineItem', {id: 1}
    equal lineItem.get('displayTotal'), "$0.00", "displayTotal should return '$0.00' if total return 0"

    lineItem.setProperties {unitPrice: 10.03434, quantity: 5}
    equal lineItem.get('displayTotal'), "$50.17", "displayTotal should return the total formated and rounded"

test 'property - displayTotalPlusTax', ->
  expect(2)
  store = @store()

  Em.run ->
    tax = store.createRecord 'tax', {id: 1, rate: 0.196}
    lineItem = store.createRecord 'lineItem', {id: 1, tax: tax}
    equal lineItem.get('displayTotalPlusTax'), "$0.00", "displayTotalPlusTax should return '$0.00' if totalPlusTax return 0"

    lineItem.setProperties {unitPrice: 10.2, quantity: 5}
    equal lineItem.get('displayTotalPlusTax'), "$61.00", "displayTotalPlusTax should return the totalPlusTax formated and rounded"

test 'property - displayUnitPrice', ->
  expect(2)
  store = @store()

  Em.run ->
    lineItem = store.createRecord 'lineItem', {id: 1}
    equal lineItem.get('displayUnitPrice'), "$0.00", "displayUnitPrice should return '$0.00' if unitPrite is unset"

    lineItem.set "unitPrice", 1000000.050
    equal lineItem.get('displayUnitPrice'), "$1,000,000.05", "displayUnitPrice should return the unit price formated and rounded"

test 'property - displayQuantity', ->
  expect(2)
  store = @store()

  Em.run ->
    lineItem = store.createRecord 'lineItem', {id: 1}
    equal lineItem.get('displayQuantity'), "0.00", "displayQuantity should return '0.00' if quantity is unset"

    lineItem.set "quantity", 10000.567
    equal lineItem.get('displayQuantity'), "10,000.57", "displayQuantity should return the quantity formated and rounded"

test 'property - VAT', ->
  expect(4)
  store = @store()

  Em.run ->
    tax = store.createRecord 'tax', {rate: 0.10}
    lineItem = store.createRecord 'lineItem', {tax: tax}
    equal lineItem.get('VAT'), null, "VAT should return null if there's no quantity and no unit price"

    lineItem.set "quantity", 10
    equal lineItem.get('VAT'), null, "VAT should return null if quanity or unit price value is missing"

    lineItem.set "unitPrice", 50
    result = lineItem.get('VAT')
    equal result.total, 50, "VAT should return a dict with the vat amount total and the tax object"
    equal result.tax.get('id'), tax.get('id'), "VAT should return a dict with the vat amount total and the tax object"

test 'method - recordIsEmpty', ->
  expect(2)
  store = @store()

  Em.run ->
    lineItem = store.createRecord 'lineItem', {}
    equal lineItem.recordIsEmpty(), true, "recordIsEmpty should return true if lineItem is empty"

    lineItem.setProperties {unitPrice: 15.35}
    equal lineItem.recordIsEmpty(), false, "recordIsEmpty should return false if lineItem is not empty"
