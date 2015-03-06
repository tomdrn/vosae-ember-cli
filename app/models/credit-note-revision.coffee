`import DS from 'ember-data'`
`import BaseRevision from 'vosae/models/base-revision'`
`import {pgettext} from 'vosae/utils/i18n'`

###
 * A data model that represents a credit note revision.
 * @class CreditNoteRevision
 * @extends BaseRevision
###

CreditNoteRevision = BaseRevision.extend
  creditNoteEmissionDate: DS.attr('date')

  # Returns the credit note emission date formated
  displayCreditNoteEmissionDate: (->
    if @get("creditNoteEmissionDate")?
      return moment(@get("creditNoteEmissionDate")).format "LL"
    return pgettext("date", "undefined")
  ).property("creditNoteEmissionDate")

`export default CreditNoteRevision`
