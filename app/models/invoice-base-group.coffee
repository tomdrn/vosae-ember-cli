`import DS from 'ember-data'`

###
 * A data model that represents a invoice base group
 * @class InvoiceBaseGroup
 * @extends DS.Model
###

InvoiceBaseGroup = DS.Model.extend
  quotation: DS.belongsTo('quotation', {async: true, inverse: null})
  purchaseOrder: DS.belongsTo('purchaseOrder', {async: true, inverse: null})
  downPaymentInvoices: DS.hasMany('downPaymentInvoice', {async: true, inverse: null})
  invoice: DS.belongsTo('invoice', {async: true, inverse: null})
  invoicesCancelled: DS.hasMany('invoice', {async: true, inverse: null})
  creditNotes: DS.hasMany('creditNote', {async: true, inverse: null})

`export default InvoiceBaseGroup`
