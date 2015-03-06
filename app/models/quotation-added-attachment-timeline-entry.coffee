`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type quotation added attachment.
 * @class QuotationAddedAttachmentTimelineEntry
 * @extends TimelineEntry
###

QuotationAddedAttachmentTimelineEntry = TimelineEntry.extend
  vosaeFile: DS.belongsTo('file')
  quotationReference: DS.attr('string')
  # quotation: DS.belongsTo('quotation')

`export default QuotationAddedAttachmentTimelineEntry`
