`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type credit note added attachment.
 * @class CreditNoteAddedAttachmentTimelineEntry
 * @extends TimelineEntry
###

CreditNoteAddedAttachmentTimelineEntry = TimelineEntry.extend
  vosaeFile: DS.belongsTo('file')
  creditNoteReference: DS.attr('string')
  # creditNote: DS.belongsTo('creditNote')

`export default CreditNoteAddedAttachmentTimelineEntry`
