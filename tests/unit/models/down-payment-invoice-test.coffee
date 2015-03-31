`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'down-payment-invoice', {
  # Specify the other units that are required for this test.
  needs: [
    'model:tax'
    'model:invoiceRevision'
    'model:payment'
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
    'model:phone'
    'model:email'
    'model:invoiceBaseGroup'
    'model:lineItem'
    'model:snapshotCurrency'
    'model:currency'
    'model:invoice'
    'model:quotation'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - isInvoice', ->
  expect(1)
  store = @store()

  Em.run ->
    downPaymentInvoice = store.createRecord "downPaymentInvoice", {}
    equal downPaymentInvoice.get('isInvoice'), false, "isInvoice should be false"

test 'property - isDownPaymentInvoice', ->
  expect(1)
  store = @store()

  Em.run ->
    downPaymentInvoice = store.createRecord "downPaymentInvoice", {}
    equal downPaymentInvoice.get('isDownPaymentInvoice'), true, "isDownPaymentInvoice should be false"
