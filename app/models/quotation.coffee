`import DS from 'ember-data'`
`import InvoiceBase from 'vosae/models/invoice-base'`
`import InvoiceMakeableMixin from 'vosae/mixins/invoice-makeable'`
`import vosaeSettings from 'vosae/conf/settings'`

###
 * A data model that represents a quotation.
 * @class Quotation
 * @extends InvoiceBase
 * @use InvoiceMakeableMixin
###

Quotation = InvoiceBase.extend InvoiceMakeableMixin,
  state: DS.attr('string')
  currentRevision: DS.belongsTo('quotationRevision')
  # revisions: DS.hasMany('quotationRevision')

  isQuotation: true

  displayState: (->
    # Returns the current state readable and translated.
    vosaeSettings.quotationStatesChoices.findProperty('value', @get('state')).get('label')
  ).property('state')

  availableStates: (->
    # List the available states for the `Quotation`, depending of its current state.
    if @get('state') is "DRAFT"
      vosaeSettings.quotationStatesChoices.filter (state) ->
        if ["AWAITING_APPROVAL", "APPROVED", "REFUSED"].contains state.get('value')
          state
    else if @get('state') is "AWAITING_APPROVAL"
      vosaeSettings.quotationStatesChoices.filter (state) ->
        if ["APPROVED", "REFUSED"].contains state.get('value')
          state
    else if @get('state') is "EXPIRED"
      vosaeSettings.quotationStatesChoices.filter (state) ->
        if ["AWAITING_APPROVAL", "APPROVED", "REFUSED"].contains state.get('value')
          state
    else if @get('state') is "REFUSED"
      vosaeSettings.quotationStatesChoices.filter (state) ->
        if ["AWAITING_APPROVAL", "APPROVED"].contains state.get('value')
          state
    else
      return []
  ).property('state')

  isIssuable: (->
    # Determine if the `Quotation` could be sent.
    if ["DRAFT"].contains(@get('state')) or !@get('state')
      return false
    return true
  ).property('state')

  getErrors: ->
    # Return an array of string that contains form validation errors
    errors = []
    errors = errors.concat @get("currentRevision").getErrors("Quotation")
    return errors

`export default Quotation`
