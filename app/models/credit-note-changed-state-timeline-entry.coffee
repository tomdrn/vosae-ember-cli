`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type contact note changed state.
 * @class CreditNoteChangedStateTimelineEntry
 * @extends TimelineEntry
###

CreditNoteChangedStateTimelineEntry = TimelineEntry.extend
  previousState: DS.attr('string')
  newState: DS.attr('string')
  creditNoteReference: DS.attr('string')
  # creditNote: DS.belongsTo('creditNote')

`export default CreditNoteChangedStateTimelineEntry`
