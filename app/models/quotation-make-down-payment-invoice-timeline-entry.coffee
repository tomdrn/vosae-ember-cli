`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type quotation make downpayment invoice.
 * @class QuotationMakeDownPaymentInvoiceTimelineEntry
 * @extends TimelineEntry
###

QuotationMakeDownPaymentInvoiceTimelineEntry = TimelineEntry.extend
  quotationReference: DS.attr('string')
  # quotation: DS.belongsTo('quotation')
  # downPaymentInvoice: DS.belongsTo('downPaymentInvoice')

`export default QuotationMakeDownPaymentInvoiceTimelineEntry`
