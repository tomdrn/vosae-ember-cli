`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'invoice-revision', {
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
    'model:snapshotCurrency'
    'model:tax'
    'model:file'
    'model:group'
    'model:specificPermission'
    'model:userSettings'
    'model:user'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'computed property - displayDueDate', ->
  expect(4)
  store = @store()

  Em.run ->
    invoiceRevision = store.createRecord "invoiceRevision", {}
    equal invoiceRevision.get('displayDueDate'), "undefined"

    invoiceRevision.set 'customPaymentConditions', "30 days"
    equal invoiceRevision.get('displayDueDate'), "variable"

    invoiceRevision.set 'dueDate', (new Date(2013, 6, 17))
    equal invoiceRevision.get('displayDueDate'), "variable (July 17, 2013)"

    invoiceRevision.set 'customPaymentConditions', null
    equal invoiceRevision.get('displayDueDate'), "July 17, 2013"

test 'computed property - displayInvoicingDate', ->
  expect(2)
  store = @store()

  Em.run ->
    invoiceRevision = store.createRecord "invoiceRevision", {}
    equal invoiceRevision.get('displayInvoicingDate'), "undefined"

    invoiceRevision.set 'invoicingDate', (new Date(2013, 6, 17))
    equal invoiceRevision.get('displayInvoicingDate'), "July 17, 2013"
