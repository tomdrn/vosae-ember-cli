`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'quotation', {
  # Specify the other units that are required for this test.
  needs: [
    'model:quotationRevision'
    'model:invoiceNote'
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
    'model:file'
    'model:localizedFile'
    'model:organization'
    'model:contact'
    'model:address'
    'model:phone'
    'model:email'
    'model:invoiceBaseGroup'
    'model:lineItem'
    'model:snapshotCurrency'
    'model:invoice'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
