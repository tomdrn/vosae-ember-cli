`import { test, moduleForModel } from 'ember-qunit'`
`import vosaeSettings from 'vosae/conf/settings'`

moduleForModel 'payment', {
  # Specify the other units that are required for this test.
  needs: [
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
    'model:currency'
    'model:invoice'
    'model:exchangeRate'
    'model:invoiceRevision'
    'model:invoiceNote'
    'model:file'
    'model:organization'
    'model:contact'
    'model:address'
    'model:phone'
    'model:email'
    'model:file'
    'model:invoiceBaseGroup'
    'model:lineItem'
    'model:localizedFile'
    'model:snapshotCurrency'
    'model:tax'
    'model:quotation'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - displayDate', ->
  expect(2)
  store = @store()

  Em.run ->
    payment = store.createRecord 'payment'
    equal payment.get('displayDate'), "undefined", "displayDate should return undefined if there is no date"

    payment.set "date", (new Date(2013, 7, 10))
    equal payment.get('displayDate'), "August 10, 2013", "displayDate should return the date formated"

test 'property - displayAmount', ->
  expect(2)
  store = @store()

  Em.run ->
    payment = store.createRecord 'payment'
    equal payment.get('displayAmount'), "", "displayAmount should return an empty string without amount"

    payment.set "amount", 1000
    equal payment.get('displayAmount'), "1,000.00", "displayAmount should return the amount formated"

test 'displayType property should return the type formated', ->
  expect(2)
  store = @store()

  Em.run ->
    payment = store.createRecord 'payment'
    equal payment.get('displayType'), "undefined", "displayType should return undefined if there is not type"

    type = vosaeSettings.paymentTypes.objectAt(0)
    payment.set 'type', type.get('value')
    equal payment.get('displayType'), type.get('label')

test 'property - displayNote', ->
  expect(2)
  store = @store()

  Em.run ->
    payment = store.createRecord 'payment'
    equal payment.get('displayNote'), "-", "displayNote should return '-' without note"

    payment.set "note", "my note"
    equal payment.get('displayNote'), "my note", "displayNote should return the note"

test 'property - amountMax', ->
  expect(2)
  store = @store()

  Em.run ->
    currencyUSD = store.createRecord 'snapshotCurrency', {symbol: "USD"}
    currencyEUR = store.createRecord 'snapshotCurrency', {symbol: "EUR"}
    currencyEUR.get('rates').addObject store.createRecord('exchangeRate', {currencyTo: "USD", rate: "2"})
    currencyEUR.get('rates').addObject store.createRecord('exchangeRate', {currencyTo: "EUR", rate: "1"})
    currentRevision = store.createRecord 'invoiceRevision', {currency: currencyEUR}
    invoice = store.createRecord 'invoice', {balance: 1000, currentRevision: currentRevision}
    payment = store.createRecord 'payment', {currency: currencyUSD, relatedTo: invoice}
    equal payment.get('amountMax'), 2000.00, "amountMax should return the amount maximum for the payment even with a different currency"

    payment.get('currency').set "symbol", "EUR"
    equal payment.get('amountMax'), 1000.00, "amountMax should return the amount maximum for the payment"

test 'method - updateWithCurrency', ->
  expect(2)
  store = @store()

  Em.run ->
    currencyUSD = store.createRecord 'snapshotCurrency', {symbol: "USD"}
    currencyEUR = store.createRecord 'snapshotCurrency', {symbol: "EUR"}
    currencyEUR.get('rates').addObject store.createRecord('exchangeRate', {currencyTo: "USD", rate: "2"})
    currencyEUR.get('rates').addObject store.createRecord('exchangeRate', {currencyTo: "EUR", rate: "1"})
    currentRevision = store.createRecord 'invoiceRevision', {currency: currencyEUR}
    invoice = store.createRecord 'invoice', {balance: 1000, currentRevision: currentRevision}
    payment = store.createRecord 'payment', {currency: currencyUSD, relatedTo: invoice, amount: 2000}
    payment.updateWithCurrency(currencyEUR)
    equal payment.get('amount'), 1000.00, "updateWithCurrency should convert the amount according to the new currency even with the same currency"

    payment.updateWithCurrency(currencyUSD)
    equal payment.get('amount'), 2000.00, "updateWithCurrency should convert the amount according to the new currency"
