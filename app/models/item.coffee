`import DS from 'ember-data'`
`import {gettext} from 'vosae/utils/i18n'`
`import formatNumber from 'accounting/format-number'`

###
 * A data model that represents an item.
 * @class Item
 * @extends DS.Model
###

Item = DS.Model.extend
  reference: DS.attr('string')
  description: DS.attr('string')
  unitPrice: DS.attr('number')
  type: DS.attr('string')
  currency: DS.belongsTo('currency')
  tax: DS.belongsTo('tax')

  displayUnitPrice: (->
    # Returns the unit price formated with a precision of 2
    if @get("unitPrice")
      return formatNumber(@get("unitPrice"), {precision: 2, decimal: "."})
    return
  ).property("unitPrice")

  displayType: (->
    # Returns the item type
    if @get('type') is "PRODUCT"
      return gettext('Product')
    gettext('Service')
  ).property('type')

  recordIsEmpty: ->
    # Return true if item is empty
    if @get 'reference'
      return false
    if @get 'description'
      return false
    if @get 'unitPrice'
      return false
    if @get 'type'
      return false
    if @get 'currency'
      return false
    if @get 'tax'
      return false
    return true

  getErrors: (type) ->
    errors = []

    unless @get("reference")
      errors.addObject gettext("Item reference must not be blank")
    unless @get("description")
      errors.addObject gettext("Item description must not be blank")
    unless @get("unitPrice")
      errors.addObject gettext("Item unit price must not be blank")
    unless @get("tax")
      errors.addObject gettext("Item tax must not be blank")
    unless @get("currency")
      errors.addObject gettext("Item currency must not be blank")
    return errors

`export default Item`
