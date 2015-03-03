`import DS from 'ember-data'`

###
 * A data model that represents an exchange rate.
 * @class ExchangeRate
 * @extends DS.Model
###

ExchangeRate = DS.Model.extend
  currencyTo: DS.attr('string')
  datetime: DS.attr('datetime')
  rate: DS.attr('number')

`export default ExchangeRate`
