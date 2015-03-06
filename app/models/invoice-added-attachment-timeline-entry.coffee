`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type invoice added attachment.
 * @class InvoiceAddedAttachmentTimelineEntry
 * @extends TimelineEntry
###

InvoiceAddedAttachmentTimelineEntry = TimelineEntry.extend
  vosaeFile: DS.belongsTo('file')
  invoiceReference: DS.attr('string')
  # invoice: DS.belongsTo('invoice')

`export default InvoiceAddedAttachmentTimelineEntry`
