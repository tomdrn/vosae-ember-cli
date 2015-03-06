`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type downpayment invoice saved.
 * @class DownPaymentInvoiceSavedTimelineEntry
 * @extends TimelineEntry
###

DownPaymentInvoiceSavedTimelineEntry = TimelineEntry.extend
  customerDisplay: DS.attr('string')
  downPaymentInvoiceReference: DS.attr('string')
  # downPaymentInvoice: DS.belongsTo('downPaymentInvoice')

`export default DownPaymentInvoiceSavedTimelineEntry`
