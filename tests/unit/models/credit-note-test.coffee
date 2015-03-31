`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'credit-note', {
  # Specify the other units that are required for this test.
  needs: [
    'model:downPaymentInvoice'
    'model:invoice'
    'model:creditNoteRevision'
    'model:invoiceNote'
    'model:file'
    'model:user'
    'model:userSettings'
    'model:organization'
    'model:contact'
    'model:invoiceBaseGroup'
    'model:tax'
    'model:invoiceRevision'
    'model:payment'
    'model:lineItem'
    'model:localizedFile'
    'model:address'
    'model:snapshotCurrency'
    'model:quotation'
    'model:group'
    'model:specificPermission'
    'model:email'
    'model:phone'
    'mixin:invoiceMakeable'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - isCreditNote', ->
  expect(1)
  store = @store()

  Em.run ->
    creditNote = store.createRecord "creditNote", {}
    equal creditNote.get('isCreditNote'), true, "isCreditNote should be true"
