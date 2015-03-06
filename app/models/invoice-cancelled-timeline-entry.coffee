`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type invoice cancelled.
 * @class InvoiceCancelledTimelineEntry
 * @extends TimelineEntry
###

InvoiceCancelledTimelineEntry = TimelineEntry.extend
  invoiceReference: DS.attr('string')
  # invoice: DS.belongsTo('invoice')
  # creditNote: DS.belongsTo('creditNote')

`export default InvoiceCancelledTimelineEntry`
