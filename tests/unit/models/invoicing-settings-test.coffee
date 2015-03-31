`import { test, moduleForModel } from 'ember-qunit'`
`import vosaeSettings from 'vosae/conf/settings'`

moduleForModel 'invoicing-settings', {
  # Specify the other units that are required for this test.
  needs: [
    'model:currency'
    'model:invoicingNumberingSettings'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'computed property - acceptedPaymentTypesFormatted', ->
  expect(2)
  store = @store()

  Em.run ->
    invoicingSettings = store.createRecord "invoicingSettings", {}
    equal invoicingSettings.get('acceptedPaymentTypesFormatted'), "undefined", "acceptedPaymentTypesFormatted should return 'undefined' if there's no accepted payment types"

    invoicingSettings.set "acceptedPaymentTypes", vosaeSettings.paymentTypes
    deepEqual invoicingSettings.get('acceptedPaymentTypesFormatted'), vosaeSettings.paymentTypes.getEach('label').join(", ").toLowerCase(), "acceptedPaymentTypesFormatted should return an array with all accepted payment types label"

test 'computed property - lateFeeRateFormated', ->
  expect(2)
  store = @store()

  Em.run ->
    invoicingSettings = store.createRecord "invoicingSettings", {}
    equal invoicingSettings.get('lateFeeRateFormated'), undefined, "lateFeeRateFormated should return undefined if there's no late fee rate"

    invoicingSettings.set "lateFeeRate", 5
    equal invoicingSettings.get('lateFeeRateFormated'), 5.00, "lateFeeRateFormated should return and format the the late fee rate"


# TODO test 'computed property - currentFyStartAt', ->

# TODO test 'computed property - currentFyStartYear', ->

test 'computed property - supportedCurrenciesSymbols', ->
  expect(2)
  store = @store()

  Em.run ->
    invoicingSettings = store.createRecord "invoicingSettings", {}
    deepEqual invoicingSettings.get('supportedCurrenciesSymbols'), [], "supportedCurrenciesSymbols should return an empty array if there is no supported currencies"

    invoicingSettings.get('supportedCurrencies').addObject(store.createRecord('currency', {symbol: '€'}))
    invoicingSettings.get('supportedCurrencies').addObject(store.createRecord('currency', {symbol: '$'}))
    deepEqual invoicingSettings.get('supportedCurrenciesSymbols'), ['€', '$'], "supportedCurrenciesSymbols should return an array containing symbols of the supported currencies"
