`import Ember from 'ember'`
`import DS from 'ember-data'`
`import formatMoney from 'accounting/format-money'`

###
 * A data model that represents a tax.
 * @class Tax
 * @extends Model
###

Tax = DS.Model.extend
  name: DS.attr('string')
  rate: DS.attr('number', defaultValue: 0.00)

  displayTax: (->
    name = @get("name")
    rate = @get('displayRate')
    name + ' ' + rate
  ).property("name", "rate")

  displayRate: (->
    formatMoney (@get("rate") * 100), {symbol: "%", format: "%v%s"}
  ).property("rate")

  checkValidity: ->
    errors = []

    unless Ember.isEmpty(errors)
      if @get('id')
        console.log 'API -> PUT  [Tax]'
      else
        console.log 'API -> POST [Tax]'
      errors.forEach (line) ->
        console.log '  ' + line

    return true if Ember.isEmpty(errors)

`export default Tax`
