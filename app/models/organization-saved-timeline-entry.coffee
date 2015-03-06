`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type organization saved.
 * @class OrganizationSavedTimelineEntry
 * @extends TimelineEntry
###

OrganizationSavedTimelineEntry = TimelineEntry.extend
  organizationName: DS.attr('string')
  organization: DS.belongsTo('organization')

`export default OrganizationSavedTimelineEntry`
