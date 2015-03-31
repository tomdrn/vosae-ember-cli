`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'quotation-revision', {
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
    'model:userSettings'
    'model:group'
    'model:specificPermission'
    'model:snapshotCurrency'
    'model:tax'
    'model:file'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'computed property - displayQuotationDate', ->
  expect(2)
  store = @store()

  Em.run ->
    quotationRevision = store.createRecord "quotationRevision", {}
    equal quotationRevision.get('displayQuotationDate'), "undefined", "displayQuotationDate should return undefined if there's no date"

    quotationRevision.set('quotationDate', new Date(2013, 7, 17))
    equal quotationRevision.get('displayQuotationDate'), "August 17, 2013", "displayQuotationDate should should format the quotationDate"

test 'computed property - displayQuotationValidity', ->
  expect(2)
  store = @store()

  Em.run ->
    quotationRevision = store.createRecord "quotationRevision", {}
    equal quotationRevision.get('displayQuotationValidity'), "undefined", "displayQuotationValidity should return undefined if there's no date"

    quotationRevision.set('quotationValidity', new Date(2013, 7, 17))
    equal quotationRevision.get('displayQuotationValidity'), "August 17, 2013", "displayQuotationValidity should should format the quotationValidity"
