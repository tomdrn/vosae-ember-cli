`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'invoice', {
  # Specify the other units that are required for this test.
  needs: [
    'model:invoiceRevision'
    'model:payment'
    'model:invoiceNote'
    'model:file'
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
    'model:organization'
    'model:contact'
    'model:address'
    'model:phone'
    'model:email'
    'model:invoiceBaseGroup'
    'model:lineItem'
    'model:localizedFile'
    'model:snapshotCurrency'
    'model:currency'
    'model:quotation'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
