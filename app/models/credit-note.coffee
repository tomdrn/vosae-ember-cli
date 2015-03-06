`import DS from 'ember-data'`
`import InvoiceBase from 'vosae/models/invoice-base'`

###
 * A data model that represents a credit note.
 * @class CreditNote
 * @extends InvoiceBase
###

CreditNote = InvoiceBase.extend
  state: DS.attr('string')
  relatedDownPaymentInvoice: DS.belongsTo('downPaymentInvoice')
  relatedInvoice: DS.belongsTo('invoice')
  currentRevision: DS.belongsTo('creditNoteRevision')
  # revisions: DS.hasMany('creditNoteRevision')

  isCreditNote: true

`export default CreditNote`
