`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type contact saved.
 * @class ContactSavedTimelineEntry
 * @extends Timeline
###

ContactSavedTimelineEntry = TimelineEntry.extend
  contactName: DS.attr('string')
  contact: DS.belongsTo('contact')

`export default ContactSavedTimelineEntry`
