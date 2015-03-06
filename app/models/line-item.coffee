`import Ember from 'ember'`
`import DS from 'ember-data'`
`import formatMoney from 'accounting/format-money'`
`import formatNumber from 'accounting/format-number'`

###
 * A data model that represents a line item.
 * @class LineItem
 * @extends DS.Model
###

LineItem = DS.Model.extend
  reference: DS.attr('string')
  description: DS.attr('string')
  itemId: DS.attr('string')
  quantity: DS.attr('number')
  unitPrice: DS.attr('number')
  tax: DS.belongsTo('tax', async: true)
  optional: DS.attr('boolean', defaultValue: false)

  shouldDisableField: (->
    # Returns true if current line item hasn't reference
    if @get('reference')
      return false
    true
  ).property('reference')

  total: (->
    if @get("quantity") and @get("unitPrice")
      return (@get("quantity") * @get("unitPrice"))
    0
  ).property("quantity", "unitPrice")

  totalPlusTax: (->
    if @get("quantity") and @get("unitPrice") and @get("tax.isLoaded")
      total = (@get("quantity") * @get("unitPrice"))
      return total + (total * @get("tax.rate"))
    0
  ).property("quantity", "unitPrice", "tax.rate", "tax.isLoaded")

  displayTotal: (->
    formatMoney @get('total')
  ).property("total")

  displayTotalPlusTax: (->
    formatMoney @get('totalPlusTax')
  ).property("totalPlusTax")

  displayUnitPrice: (->
    if @get("unitPrice")
      return formatMoney @get("unitPrice")
    formatMoney 0
  ).property("unitPrice")

  displayQuantity: (->
    # TODO : HOW SHOULD WE ROUND THE QUANTITY ?!
    if @get("quantity")
      return formatNumber @get("quantity"), 2
    formatNumber 0, 2
  ).property("quantity")

  guid: (->
    Em.guidFor @
  ).property()

  didLoad: ->
    # This hack is used to refresh the `taxes` computed property
    # on model BaseRevision once the current tax is loaded
    tax = @get 'tax'
    if tax? and not tax.get('isLoaded')
      tax.then =>
        @propertyDidChange('tax')

  # VAT: ->
  #   tax = @get 'tax'
  #   new Ember.RSVP.Promise (resolve) =>
  #     resolve(null) if not tax
  #     tax.then (tax) =>
  #       if @get("quantity") and @get("unitPrice")
  #         total = (@get("quantity") * @get("unitPrice")) * tax.get("rate")
  #         resolve(
  #           total: total
  #           tax: tax
  #         )
  #       resolve(null)

  VAT: (->
    if @get('tax.isLoaded') and @get('quantity') and @get('unitPrice')
      if @get('tax.rate')
        total = (@get("quantity") * @get("unitPrice")) * @get("tax.rate")
        return {total: total, tax: @get('tax')}
    null
  ).property('quantity', 'unitPrice', 'tax.isLoaded', 'tax.rate')

  recordIsEmpty: ->
    # Return true if item is empty
    if @get 'reference'
      console.log 'here'
      return false
    if @get 'description'
      console.log 'here1'
      return false
    if @get 'itemId'
      console.log 'here2'
      return false
    if @get 'quantity'
      console.log 'here3'
      return false
    if @get 'unitPrice'
      return false
    if @get 'tax.id'
      return false
    return true

`export default LineItem`
