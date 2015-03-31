`import { test, moduleForModel } from 'ember-qunit'`
`import vosaeSettings from 'vosae/conf/settings'`
`import arrayContains from '../../helpers/array-contains'`

moduleForModel 'purchase-order', {
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
    'model:purchaseOrderRevision'
    'model:invoiceNote'
    'model:invoiceBaseGroup'
    'model:invoice'
    'model:quotation'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'computed property - displayState', ->
  expect(vosaeSettings.purchaseOrderStatesChoices.length)
  store = @store()

  Em.run ->
    purchaseOrder = store.createRecord "purchaseOrder", {}
    vosaeSettings.purchaseOrderStatesChoices.forEach (state) ->
      purchaseOrder.set 'state', state.get('value')
      ok purchaseOrder.get('displayState'), "displayState should return the acutal state formated"

test 'computed property - availableStates', ->
  expect(11)
  store = @store()

  Em.run ->
    purchaseOrder = store.createRecord "purchaseOrder", {}

    # NO STATE
    availableStates = purchaseOrder.get('availableStates')
    deepEqual availableStates, []

    # DRAFT
    purchaseOrder.set "state", "DRAFT"
    availableStates = purchaseOrder.get('availableStates')

    equal availableStates.get('length'), 3
    arrayContains availableStates.getEach('label'), "Awaiting approval"
    arrayContains availableStates.getEach('label'), "Approved"
    arrayContains availableStates.getEach('label'), "Refused"

    # AWAITING APPROVAL
    purchaseOrder.set "state", "AWAITING_APPROVAL"
    availableStates = purchaseOrder.get('availableStates')

    equal availableStates.get('length'), 2
    arrayContains availableStates.getEach('label'), "Approved"
    arrayContains availableStates.getEach('label'), "Refused"

    # EXPIRED
    purchaseOrder.set "state", "REFUSED"
    availableStates = purchaseOrder.get('availableStates')

    equal availableStates.get('length'), 2
    arrayContains availableStates.getEach('label'), "Awaiting approval"
    arrayContains availableStates.getEach('label'), "Approved"

test 'computed property - isIssuable', ->
  expect(6)
  store = @store()

  Em.run ->
    purchaseOrder = store.createRecord "purchaseOrder", {}
    equal purchaseOrder.get('isIssuable'), false, "isIssuable return false if purchase order hasn't state"

    purchaseOrder.set "state", "DRAFT"
    equal purchaseOrder.get('isIssuable'), false, "isIssuable return false if purchase order is draft"

    purchaseOrder.set "state", "AWAITING_APPROVAL"
    equal purchaseOrder.get('isIssuable'), true, "isIssuable return true if purchase order is awaiting approval"

    purchaseOrder.set "state", "REFUSED"
    equal purchaseOrder.get('isIssuable'), true, "isIssuable return true if purchase order is refused"

    purchaseOrder.set "state", "APPROVED"
    equal purchaseOrder.get('isIssuable'), true, "isIssuable return true if purchase order is approved"

    purchaseOrder.set "state", "INVOICED"
    equal purchaseOrder.get('isIssuable'), true, "isIssuable return true if purchase order is invoiced"
