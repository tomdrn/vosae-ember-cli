`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type quotation make invoice.
 * @class QuotationMakeInvoiceTimelineEntry
 * @extends TimelineEntry
###

QuotationMakeInvoiceTimelineEntry = TimelineEntry.extend
  customerDisplay: DS.attr('string')
  quotationReference: DS.attr('string')
  # quotation: DS.belongsTo('quotation')
  invoiceReference: DS.attr('string')
  invoiceHasTemporaryReference: DS.attr('boolean')
  # invoice: DS.belongsTo('invoice')

`export default QuotationMakeInvoiceTimelineEntry`
