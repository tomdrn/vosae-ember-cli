`import DS from 'ember-data'`
`import BaseRevision from 'vosae/models/base-revision'`
`import {pgettext} from 'vosae/utils/i18n'`

###
 * A data model that represents an invoice revision.
 * @class InvoiceRevision
 * @extends BaseRevision
###

InvoiceRevision = BaseRevision.extend
  invoicingDate: DS.attr('date')
  dueDate: DS.attr('date')

  # Return the due date formated
  displayDueDate: (->
    if @get("customPaymentConditions")?
      if @get("dueDate")?
        return "#{pgettext("date", "variable")} (#{moment(@get("dueDate")).format "LL"})"
      else
        return pgettext("date", "variable")
    else if @get("dueDate")?
      return moment(@get("dueDate")).format "LL"
    return pgettext("date", "undefined")
  ).property("dueDate", "customPaymentConditions")

  # Returns the invoice date formated
  displayInvoicingDate: (->
    if @get("invoicingDate")?
      return moment(@get("invoicingDate")).format "LL"
    return pgettext("date", "undefined")
  ).property("invoicingDate")

`export default InvoiceRevision`
