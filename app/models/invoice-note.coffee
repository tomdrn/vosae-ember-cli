`import DS from 'ember-data'`

###
 * A data model that represents an invoice note.
 * @class InvoiceNote
 * @extends DS.Model
###

InvoiceNote = DS.Model.extend
  registrationDate: DS.attr('date')
  note: DS.attr('string')
  issuer: DS.belongsTo('user')

InvoiceNote.reopen
  invoice: DS.belongsTo('invoice')
  quotation: DS.belongsTo('quotation')

`export default InvoiceNote`
