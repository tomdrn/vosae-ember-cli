`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'invoice-note', {
  # Specify the other units that are required for this test.
  needs: [
    'model:file'
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
    'model:invoice'
    'model:quotation'
    'model:invoiceRevision'
    'model:payment'
    'model:organization'
    'model:contact'
    'model:address'
    'model:phone'
    'model:email'
    'model:invoiceBaseGroup'
    'model:quotationRevision'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
