`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'invoice-base-group', {
  # Specify the other units that are required for this test.
  needs: [
    'model:quotation'
    'model:purchaseOrder'
    'model:downPaymentInvoice'
    'model:invoice'
    'model:creditNote'
    'model:invoiceNote'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
