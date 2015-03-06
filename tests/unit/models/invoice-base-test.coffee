`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'invoice-base', {
  # Specify the other units that are required for this test.
  needs: [
    'model:invoiceNote'
    'model:file'
    'model:localizedFile'
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
    'model:organization'
    'model:contact'
    'model:address'
    'model:email'
    'model:phone'
    'model:invoiceRevision'
    'model:invoiceBaseGroup'
    'model:invoice'
    'model:quotation'
    'model:lineItem'
    'model:tax'
    'model:snapshotCurrency'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
