`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'purchase-order-revision', {
  # Specify the other units that are required for this test.
  needs: [
    'model:lineItem'
    'model:localizedFile'
    'model:organization'
    'model:contact'
    'model:address'
    'model:phone'
    'model:email'
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
    'model:snapshotCurrency'
    'model:tax'
    'model:file'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'computed property - displayPurchaseOrderDate', ->
  expect(2)
  store = @store()

  Em.run ->
    purchaseOrderRevision = store.createRecord "purchaseOrderRevision", {}
    equal purchaseOrderRevision.get('displayPurchaseOrderDate'), "undefined", "displayPurchaseOrderDate should return undefined if there's no date"

    purchaseOrderRevision.set('purchaseOrderDate', new Date(2013, 7, 17))
    equal purchaseOrderRevision.get('displayPurchaseOrderDate'), "August 17, 2013", "displayPurchaseOrderDate should should format the quotationDate"
