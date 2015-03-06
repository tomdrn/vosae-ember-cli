`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type credit note saved.
 * @class CreditNoteSavedTimelineEntry
 * @extends TimelineEntry
###

CreditNoteSavedTimelineEntry = TimelineEntry.extend
  customerDisplay: DS.attr('string')
  creditNoteReference: DS.attr('string')
  # creditNote: DS.belongsTo('creditNote')

`export default CreditNoteSavedTimelineEntry`
