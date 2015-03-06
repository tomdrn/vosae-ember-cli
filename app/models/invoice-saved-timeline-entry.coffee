`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type invoice saved.
 * @class InvoiceSavedTimelineEntry
 * @extends TimelineEntry
###

InvoiceSavedTimelineEntry = TimelineEntry.extend
  customerDisplay: DS.attr('string')
  invoiceReference: DS.attr('string')
  # invoice: DS.belongsTo('invoice')
  invoiceHasTemporaryReference: DS.attr('boolean')

`export default InvoiceSavedTimelineEntry`
