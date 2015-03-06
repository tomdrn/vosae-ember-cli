`import DS from 'ember-data'`
`import BaseRevision from 'vosae/models/base-revision'`
`import {pgettext} from 'vosae/utils/i18n'`

###
 * A data model that represents a quotation revision.
 * @class QuotationRevision
 * @extends BaseRevision
###

QuotationRevision = BaseRevision.extend
  quotationDate: DS.attr('date')
  quotationValidity: DS.attr('date')

  # Returns the quotation date formated
  displayQuotationDate: (->
    if @get("quotationDate")?
      return moment(@get("quotationDate")).format "LL"
    return pgettext("date", "undefined")
  ).property("quotationDate")

  # Returns the quotation validity formated
  displayQuotationValidity: (->
    if @get("quotationValidity")?
      return moment(@get("quotationValidity")).format "LL"
    return pgettext("date", "undefined")
  ).property("quotationValidity")

`export default QuotationRevision`
