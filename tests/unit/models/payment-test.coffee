`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'payment', {
  # Specify the other units that are required for this test.
  needs: [
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
    'model:currency'
    'model:invoice'
    'model:exchangeRate'
    'model:invoiceRevision'
    'model:invoiceNote'
    'model:file'
    'model:organization'
    'model:contact'
    'model:address'
    'model:phone'
    'model:email'
    'model:file'
    'model:invoiceBaseGroup'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
