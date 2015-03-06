`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type quotation saved.
 * @class QuotationSavedTimelineEntry
 * @extends TimelineEntry
###

QuotationSavedTimelineEntry = TimelineEntry.extend
  customerDisplay: DS.attr('string')
  quotationReference: DS.attr('string')
  # quotation: DS.belongsTo('quotation')

`export default QuotationSavedTimelineEntry`
