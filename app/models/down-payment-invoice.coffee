`import DS from 'ember-data'`
`import Invoice from 'vosae/models/invoice'`

###
 * A data model that represents a down payement invoice.
 * @class DownPaymentInvoice
 * @extends Invoice
###

DownPaymentInvoice = Invoice.extend
  percentage: DS.attr('string')
  taxApplied: DS.belongsTo('tax')

  isInvoice: false
  isDownPaymentInvoice: true

`export default DownPaymentInvoice`
