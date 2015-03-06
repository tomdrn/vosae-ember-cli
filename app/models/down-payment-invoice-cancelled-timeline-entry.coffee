`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type downpayment invoice cancelled.
 * @class DownPaymentInvoiceCancelledTimelineEntry
 * @extends TimelineEntry
###

DownPaymentInvoiceCancelledTimelineEntry = TimelineEntry.extend
  downPaymentInvoiceReference: DS.attr('string')
  # downPaymentInvoice: DS.belongsTo('downPaymentInvoice')
  # creditNote: DS.belongsTo('creditNote')

`export default DownPaymentInvoiceCancelledTimelineEntry`
