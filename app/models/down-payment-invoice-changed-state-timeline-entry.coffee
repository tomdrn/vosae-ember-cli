`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type downpayment invoice changed state.
 * @class DownPaymentInvoiceChangedStateTimelineEntry
 * @extends TimelineEntry
###

DownPaymentInvoiceChangedStateTimelineEntry = TimelineEntry.extend
  previousState: DS.attr('string')
  newState: DS.attr('string')
  downPaymentInvoiceReference: DS.attr('string')
  # downPaymentInvoice: DS.belongsTo('downPaymentInvoice')

`export default DownPaymentInvoiceChangedStateTimelineEntry`
