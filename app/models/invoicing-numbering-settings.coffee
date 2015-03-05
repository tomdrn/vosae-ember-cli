`import DS from 'ember-data'`
`import Ember from 'ember'`
`import vosaeSettings from 'vosae/conf/settings'`

inflector = Ember.Inflector.inflector
inflector.irregular 'invoicingNumberingSettings', 'invoicingNumberingSettings'

###
 * A data model that represents settings for invoicing numbering.
 * @class InvoicingNumberingSettings
 * @extends DS.Model
###

InvoicingNumberingSettings = DS.Model.extend
  scheme: DS.attr('string')
  separator: DS.attr('string')
  dateFormat: DS.attr('string')
  fyReset: DS.attr('boolean')

  preview: (->
    if @get('scheme') is "N"
      preview = "00000"
    else
      format = vosaeSettings.invoicingDateFormats.findProperty('value', @get('dateFormat'))
      preview = moment().format(format.get('label'))
      preview += @get('separator') + "00000"
    preview
  ).property('scheme','dateFormat','separator')

  schemeIsNumber: (->
    return true if @get('scheme') is "N"
    false
  ).property('scheme')

`export default InvoicingNumberingSettings`
