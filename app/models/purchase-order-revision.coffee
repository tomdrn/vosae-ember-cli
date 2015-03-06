`import DS from 'ember-data'`
`import BaseRevision from 'vosae/models/base-revision'`
`import {pgettext} from 'vosae/utils/i18n'`

###
 * A data model that represents a purchase order revision.
 * @class PurchaseOrderRevision
 * @extends BaseRevision
###

PurchaseOrderRevision = BaseRevision.extend
  purchaseOrderDate: DS.attr('date')

  # Returns the purchase order creation date formated
  displayPurchaseOrderDate: (->
    if @get("purchaseOrderDate")?
      return moment(@get("purchaseOrderDate")).format "LL"
    return pgettext("date", "undefined")
  ).property("purchaseOrderDate")

`export default PurchaseOrderRevision`
