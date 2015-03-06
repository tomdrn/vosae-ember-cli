`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'purchase-order', {
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
    'model:purchaseOrderRevision'
    'model:invoiceNote'
    'model:invoiceBaseGroup'
    'model:invoice'
    'model:quotation'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
