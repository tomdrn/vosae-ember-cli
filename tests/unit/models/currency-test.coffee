`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'currency', {
  # Specify the other units that are required for this test.
  needs: [
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - description', ->
  expect(2)
  store = @store()

  Em.run ->
    currency = store.createRecord 'currency', {id: 1, symbol: "SOMETHINGSHITTY"}
    equal currency.get('description'), '', "with a bad currency's symbol the description should return an empty string"

    currency.set 'symbol', 'EUR'
    equal currency.get('description'), 'Euro', "with a good currency the description should return the currency's description"

test 'property - displaySign', ->
  expect(2)
  store = @store()

  Em.run ->
    currency = store.createRecord 'currency', {id: 1, symbol: ""}
    equal currency.get('displaySign'), '', "with a bad currency's symbol the displaySign should return an empty string"

    currency.set 'symbol', 'EUR'
    equal currency.get('displaySign'), '€', "with a good currency displaySign should return the currency's sign"


test 'property - displaySignWithSymbol', ->
  expect(2)
  store = @store()

  Em.run ->
    currency = store.createRecord 'currency', {id: 1, symbol: ""}
    equal currency.get('displaySignWithSymbol'), '', "with a bad currency's symbol the displaySignWithSymbol should return an empty string"

    currency.set 'symbol', 'EUR'
    equal currency.get('displaySignWithSymbol'), '€ - EUR', "with a good currency displaySignWithSymbol should return the currency's sign with symbol"


test 'method - exchangeRateFor', ->
  expect(1)
  store = @store()

  Em.run ->
    currency = store.createRecord 'currency', {id: 1, symbol: "EUR"}
    currency.get('rates').addObject(store.createRecord('exchangeRate', {id: 1, currencyTo: "USD", rate: 1.32}))
    currency.get('rates').addObject(store.createRecord('exchangeRate', {id: 2, currencyTo: "JPY", rate: 0.3}))

    rateUSD = currency.get('rates').objectAt(0).get('rate')
    equal currency.exchangeRateFor('USD'), rateUSD, "exchangeRateFor method should return the exchangeRate associated to the specified symbol"

test 'method - toCurrency', ->
  expect(1)
  store = @store()

  Em.run ->
    currency = store.createRecord 'currency', {id: 1, symbol: "EUR"}
    currency.get('rates').addObject(store.createRecord('exchangeRate', {id: 1, currencyTo: "USD", rate: 1.32}))

    equal currency.toCurrency('USD', 10).round(2), 13.2, "toCurrency should convert an amount from a currency to another, based on the rates"

test 'method - fromCurrency', ->
  expect(1)
  store = @store()

  Em.run ->
    currency = store.createRecord 'currency', {id: 1, symbol: "EUR"}
    currency.get('rates').addObject(store.createRecord('exchangeRate', {id: 1, currencyTo: "USD", rate: 1.32}))

    equal currency.fromCurrency('USD', 132), 100, "fromCurrency should convert an amount from a currency to another, based on the rates"
