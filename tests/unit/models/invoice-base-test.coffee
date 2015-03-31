`import { test, moduleForModel } from 'ember-qunit'`
`import config from 'vosae/config/environment'`

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
    'model:payment'
    'model:currency'
    'model:quotationRevision'
    'model:purchaseOrder'
    'model:purchaseOrderRevision'
    'adapter:application'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - isUploading', ->
  expect(1)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('isUploading'), false, "isUploading should be false"

test 'property - isUpdatingState', ->
  expect(1)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('isUpdatingState'), false, "isUpdatingState should be false"

test 'property - isGeneratingPdfState', ->
  expect(1)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('isGeneratingPdfState'), false, "isGeneratingPdfState should be false"

test 'property - isQuotation', ->
  expect(1)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('isQuotation'), false, "isQuotation should be false"

test 'property - isPurchaseOrder', ->
  expect(1)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('isPurchaseOrder'), false, "isPurchaseOrder should be false"

test 'property - isInvoice', ->
  expect(1)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('isInvoice'), false, "isInvoice should be false"

test 'property - isDownPaymentInvoice', ->
  expect(1)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('isDownPaymentInvoice'), false, "isDownPaymentInvoice should be false"

test 'property - isCreditNote', ->
  expect(1)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('isCreditNote'), false, "isCreditNote should be false"

test 'property - relatedColor', ->
  expect(3)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('relatedColor'), "success", "relatedColor should be success by default"

    invoiceBase = store.createRecord "quotation", {}
    equal invoiceBase.get('relatedColor'), "primary", "relatedColor should be primary for quotations"

    invoiceBase = store.createRecord "purchaseOrder", {}
    equal invoiceBase.get('relatedColor'), "primary", "relatedColor should be primary for purchase orders"

test 'property - canHaveOptionalLineItems', ->
  expect(3)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('canHaveOptionalLineItems'), false, "canHaveOptionalLineItems should return false by default"

    invoiceBase = store.createRecord "quotation", {}
    equal invoiceBase.get('canHaveOptionalLineItems'), true, "canHaveOptionalLineItems should return true for quotations"

    invoiceBase = store.createRecord "purchaseOrder", {}
    equal invoiceBase.get('canHaveOptionalLineItems'), true, "canHaveOptionalLineItems should return true for purchase orders"

test 'computed property - displayReceiver', ->
  expect(3)
  store = @store()

  Em.run ->
    invoiceBase = store.createRecord "invoiceBase", {}
    equal invoiceBase.get('displayReceiver'), "", "displayReceiver should return an empty string if there's no contact and no organization"

    invoiceBase.set 'contact', store.createRecord('contact', {firstname: 'Thomas'})
    equal invoiceBase.get('displayReceiver'), "Thomas", "displayReceiver should return contact's full name if there's no organization"

    invoiceBase.set 'organization', store.createRecord('organization', {corporateName: 'Naeka'})
    equal invoiceBase.get('displayReceiver'), "Naeka", "displayReceiver should return organization's corporate name"

test 'computed property - addAttachmentURL', ->
  expect(1)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {id: 1}
    equal invoice.get('addAttachmentURL'), "#{config.APP.endpoint}/#{config.APP.namespace}" + "invoices/1/add_attachment/"

# TODO test 'method' - markAsState', ->

# TODO test 'method' - downloadPdf', ->
