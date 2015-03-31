`import { test, moduleForModel } from 'ember-qunit'`
`import vosaeSettings from 'vosae/conf/settings'`
`import arrayContains from '../../helpers/array-contains'`

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
  assert.ok !!model

test 'property - isQuotation', ->
  expect(1)
  store = @store()

  Em.run ->
    quotation = store.createRecord "quotation", {}
    equal quotation.get('isQuotation'), true, "isQuotation should be true"

test 'computed property - displayState', ->
  expect(vosaeSettings.quotationStatesChoices.length)
  store = @store()

  Em.run ->
    quotation = store.createRecord "quotation", {}
    vosaeSettings.quotationStatesChoices.forEach (state) ->
      quotation.set 'state', state.get('value')
      ok quotation.get('displayState'), "displayState should return the acutal state formated"

test 'computed property - availableStates', ->
  expect(15)
  store = @store()

  Em.run ->
    quotation = store.createRecord "quotation", {}

    # NO STATE
    availableStates = quotation.get('availableStates')
    deepEqual availableStates, []

    # DRAFT
    quotation.set "state", "DRAFT"
    availableStates = quotation.get('availableStates')

    equal availableStates.get('length'), 3
    arrayContains availableStates.getEach('label'), "Awaiting approval"
    arrayContains availableStates.getEach('label'), "Approved"
    arrayContains availableStates.getEach('label'), "Refused"

    # AWAITING APPROVAL
    quotation.set "state", "AWAITING_APPROVAL"
    availableStates = quotation.get('availableStates')

    equal availableStates.get('length'), 2
    arrayContains availableStates.getEach('label'), "Approved"
    arrayContains availableStates.getEach('label'), "Refused"

    # EXPIRED
    quotation.set "state", "EXPIRED"
    availableStates = quotation.get('availableStates')

    equal availableStates.get('length'), 3
    arrayContains availableStates.getEach('label'), "Awaiting approval"
    arrayContains availableStates.getEach('label'), "Approved"
    arrayContains availableStates.getEach('label'), "Refused"

    # REFUSED
    quotation.set "state", "REFUSED"
    availableStates = quotation.get('availableStates')

    equal availableStates.get('length'), 2
    arrayContains availableStates.getEach('label'), "Awaiting approval"
    arrayContains availableStates.getEach('label'), "Approved"

test 'computed property - isIssuable', ->
  expect(7)
  store = @store()

  Em.run ->
    quotation = store.createRecord "quotation", {}
    equal quotation.get('isIssuable'), false, "isIssuable return false if quotation hasn't state"

    quotation.set "state", "DRAFT"
    equal quotation.get('isIssuable'), false, "isIssuable return false if quotation is draft"

    quotation.set "state", "EXPIRED"
    equal quotation.get('isIssuable'), true, "isIssuable return true if quotation is expired"

    quotation.set "state", "AWAITING_APPROVAL"
    equal quotation.get('isIssuable'), true, "isIssuable return true if quotation is awaiting approval"

    quotation.set "state", "REFUSED"
    equal quotation.get('isIssuable'), true, "isIssuable return true if quotation is refused"

    quotation.set "state", "APPROVED"
    equal quotation.get('isIssuable'), true, "isIssuable return true if quotation is approved"

    quotation.set "state", "INVOICED"
    equal quotation.get('isIssuable'), true, "isIssuable return true if quotation is invoiced"
