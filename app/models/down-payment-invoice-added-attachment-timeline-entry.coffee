`import DS from 'ember-data'`
`import TimelineEntry from 'vosae/models/timeline-entry'`

###
 * A data model that represents a timeline entry of type downpayment invoice added attachment.
 * @class DownPaymentInvoiceAddedAttachmentTimelineEntry
 * @extends TimelineEntry
###

DownPaymentInvoiceAddedAttachmentTimelineEntry = TimelineEntry.extend
  vosaeFile: DS.belongsTo('file')
  downPaymentInvoiceReference: DS.attr('string')
  # downPaymentInvoice: DS.belongsTo('downPaymentInvoice')

`export default DownPaymentInvoiceAddedAttachmentTimelineEntry`
