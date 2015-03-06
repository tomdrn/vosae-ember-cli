`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type quotation changed state.
 * @class QuotationChangedStateTimelineEntry
 * @extends Vosae.Timeline
###

QuotationChangedStateTimelineEntry = TimelineEntry.extend
  previousState: DS.attr('string')
  newState: DS.attr('string')
  quotationReference: DS.attr('string')
  # quotation: DS.belongsTo('quotation')

`export default QuotationChangedStateTimelineEntry`
