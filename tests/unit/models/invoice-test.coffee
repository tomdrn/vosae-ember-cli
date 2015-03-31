`import { test, moduleForModel } from 'ember-qunit'`
`import vosaeSettings from 'vosae/conf/settings'`
`import arrayContains from '../../helpers/array-contains'`

moduleForModel 'invoice', {
  # Specify the other units that are required for this test.
  needs: [
    'model:invoiceRevision'
    'model:payment'
    'model:invoiceNote'
    'model:file'
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
    'model:localizedFile'
    'model:snapshotCurrency'
    'model:currency'
    'model:quotation'
    'model:exchangeRate'
    'model:tax'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - isInvoice', ->
  expect(1)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isInvoice'), true, "isInvoice should be true"

test 'computed property - isInvoice', ->
  expect(vosaeSettings.invoiceStatesChoices.length)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    vosaeSettings.invoiceStatesChoices.forEach (state) ->
      invoice.set('state', state.get('value'))
      ok invoice.get('displayState'), "displayState property should return the actual state formated"

test 'computed property - canAddPayment', ->
  expect(4)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {state: "REGISTERED"}
    equal invoice.get('canAddPayment'), false, "canAddPayment should return false if invoice is not payable"

    invoice.set 'balance', 0
    equal invoice.get('canAddPayment'), false, "canAddPayment should return false if balance is 0"

    invoice.set 'balance', 1000
    equal invoice.get('canAddPayment'), true, "canAddPayment should return true if invoice is payable and balance > 0"

    invoice.get('payments').addObject(store.createRecord('payment', {}))
    equal invoice.get('canAddPayment'), false, "canAddPayment should return false if there's an uncommited payment"

test 'computed property - availableStates', ->
  expect(11)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    availableStates = invoice.get('availableStates')

    deepEqual availableStates, [], "availableStates should return an empty array if invoice has no state"

    invoice.set "state", "DRAFT"
    availableStates = invoice.get('availableStates')

    equal availableStates.get('length'), 1
    arrayContains availableStates.getEach('value'), "REGISTERED"

    invoice.set "state", "REGISTERED"
    availableStates = invoice.get('availableStates')

    equal availableStates.get('length'), 1
    arrayContains availableStates.getEach('value'), "CANCELLED"

    invoice.set "state", "OVERDUE"
    availableStates = invoice.get('availableStates')

    equal availableStates.get('length'), 1
    arrayContains availableStates.getEach('value'), "CANCELLED"

    invoice.set "state", "PART_PAID"
    availableStates = invoice.get('availableStates')

    equal availableStates.get('length'), 1
    arrayContains availableStates.getEach('value'), "CANCELLED"

    invoice.set "state", "PAID"
    availableStates = invoice.get('availableStates')

    equal availableStates.get('length'), 1
    arrayContains availableStates.getEach('value'), "CANCELLED"

test 'computed property - isModifiable', ->
  expect(7)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isModifiable'), false, "isModifiable should return false if invoice has no state"

    vosaeSettings.invoiceStatesChoices.forEach (state) ->
      invoice.set('state', state.get('value'))
      if state.get('value') is 'DRAFT'
        equal invoice.get('isModifiable'), true, "isModifiable should return true if invoice's state is DRAFT"
      else
        equal invoice.get('isModifiable'), false, "isModifiable should return false if invoice's state isnt DRAFT"

test 'computed property - isDeletable', ->
  expect(2)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isDeletable'), false, "isDeletable should return false if invoice is not modifiable"

    invoice.set "state", "DRAFT"
    equal invoice.get('isDeletable'), true, "isDeletable should return true if invoice is modifiable"

test 'computed property - isCancelable', ->
  expect(7)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isCancelable'), false, "isCancelable should return false if invoice has no state"

    vosaeSettings.invoiceStatesChoices.forEach (state) ->
      invoice.set('state', state.get('value'))
      if ["REGISTERED", "OVERDUE", "PART_PAID", "PAID"].contains state.get('value')
        equal invoice.get('isCancelable'), true, "isCancelable should return true if invoice's state is REGISTERED, OVERDUE, PART_PAID or PAID"
      else
        equal invoice.get('isCancelable'), false, "isCancelable should return false if invoice's state is DRAFT OR CANCELLED"

test 'computed property - isPayable', ->
  expect(7)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isPayable'), false, "isPayable should return false if invoice has no state"

    vosaeSettings.invoiceStatesChoices.forEach (state) ->
      invoice.set('state', state.get('value'))
      if ["REGISTERED", "OVERDUE", "PART_PAID"].contains state.get('value')
        equal invoice.get('isPayable'), true, "isPayable should return true if invoice's state is REGISTERED, OVERDUE, PART_PAID"
      else
        equal invoice.get('isPayable'), false, "isPayable should return false if invoice's state is DRAFT, CANCELLED or PAID"

test 'computed property - isIssuable', ->
  expect(7)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isIssuable'), false, "isIssuable should return false if invoice has no state"

    vosaeSettings.invoiceStatesChoices.forEach (state) ->
      invoice.set('state', state.get('value'))
      if ["DRAFT", "CANCELLED"].contains state.get('value')
        equal invoice.get('isIssuable'), true, "isIssuable should return true if invoice's state is DRAFT or CANCELLED"
      else
        equal invoice.get('isIssuable'), false, "isIssuable should return false if invoice's state isnt DRAFT or CANCELLED"

test 'computed property - isPayableOrPaid', ->
  expect(7)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isPayableOrPaid'), false, "isPayableOrPaid should return false if invoice has no state"

    vosaeSettings.invoiceStatesChoices.forEach (state) ->
      invoice.set('state', state.get('value'))
      if ["REGISTERED", "OVERDUE", "PART_PAID", "PAID"].contains state.get('value')
        equal invoice.get('isPayableOrPaid'), true, "isPayableOrPaid should return true if invoice's state is REGISTERED, OVERDUE, PART_PAID or PAID"
      else
        equal invoice.get('isPayableOrPaid'), false, "isPayableOrPaid should return false if invoice's state is DRAFT, CANCELLED"

test 'computed property - isPaid', ->
  expect(7)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isPaid'), false, "isPaid should return false if invoice has no state"

    vosaeSettings.invoiceStatesChoices.forEach (state) ->
      invoice.set('state', state.get('value'))
      if state.get('value') is 'PAID'
        equal invoice.get('isPaid'), true, "isPaid should return true if invoice's state is PAID"
      else
        equal invoice.get('isPaid'), false, "isPaid should return false if invoice's state isnt PAID"

test 'computed property - isDraft', ->
  expect(7)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isDraft'), false, "isDraft should return false if invoice has no state"

    vosaeSettings.invoiceStatesChoices.forEach (state) ->
      invoice.set('state', state.get('value'))
      if state.get('value') is 'DRAFT'
        equal invoice.get('isDraft'), true, "isDraft should return true if invoice's state is DRAFT"
      else
        equal invoice.get('isDraft'), false, "isDraft should return false if invoice's state isnt DRAFT"

test 'computed property - isCancelled', ->
  expect(7)
  store = @store()

  Em.run ->
    invoice = store.createRecord "invoice", {}
    equal invoice.get('isCancelled'), false, "isCancelled should return false if invoice has no state"

    vosaeSettings.invoiceStatesChoices.forEach (state) ->
      invoice.set('state', state.get('value'))
      if state.get('value') is 'CANCELLED'
        equal invoice.get('isCancelled'), true, "isCancelled should return true if invoice's state is CANCELLED"
      else
        equal invoice.get('isCancelled'), false, "isCancelled should return false if invoice's state isnt CANCELLED"

test 'computed property - isInvoicable', ->
  expect(10)
  store = @store()

  Em.run ->
    contact = store.createRecord "contact", {}
    organization = store.createRecord "organization", {}
    invoiceRevision = store.createRecord "invoiceRevision", {}
    invoice = store.createRecord "invoice", {
      'state': 'DRAFT'
      'contact': contact
      'organization': organization
      'currentRevision': invoiceRevision
      'currentRevision.invoicingDate': (new Date())
      'currentRevision.dueDate': (new Date())
      'currentRevision.customPaymentConditions': 'CASH'
    }

    equal invoice.get('isInvoicable'), false, "isInvoicable should return false if invoice has no line items"

    invoice.get('currentRevision.lineItems').createRecord()
    equal invoice.get('isInvoicable'), true

    invoice.set 'state', 'REGISTERED'
    equal invoice.get('isInvoicable'), false, "isInvoicable should return false if invoice state isnt DRAFT"

    invoice.set 'state', 'DRAFT'
    invoice.set 'contact', null
    equal invoice.get('isInvoicable'), true

    invoice.set 'organization', null
    equal invoice.get('isInvoicable'), false, "isInvoicable should return false if invoice has no contact and no organization"

    invoice.set 'contact', contact
    invoice.set 'organization', organization
    invoice.set 'currentRevision.invoicingDate', null
    equal invoice.get('isInvoicable'), false, "isInvoicable should return false if invoice has no invoicing date"

    invoice.set 'currentRevision.invoicingDate', (new Date())
    equal invoice.get('isInvoicable'), true

    invoice.set 'currentRevision.dueDate', null
    equal invoice.get('isInvoicable'), true

    invoice.set 'currentRevision.customPaymentConditions', null
    equal invoice.get('isInvoicable'), false, "isInvoicable sould return false if invoice has no due date and not payment conditions"

    invoice.set 'currentRevision.dueDate', (new Date())
    invoice.set 'currentRevision.customPaymentConditions', 'CASH'
    equal invoice.get('isInvoicable'), true
