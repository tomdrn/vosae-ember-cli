`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type invoice changed state.
 * @class InvoiceChangedStateTE
 * @extends Timeline
###

InvoiceChangedStateTimelineEntry = TimelineEntry.extend
  previousState: DS.attr('string')
  newState: DS.attr('string')
  invoiceReference: DS.attr('string')
  # invoice: DS.belongsTo('invoice')

`export default InvoiceChangedStateTimelineEntry`
