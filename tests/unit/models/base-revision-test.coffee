`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'base-revision', {
  # Specify the other units that are required for this test.
  needs: [
    'model:lineItem'
    'model:localizedFile'
    'model:organization'
    'model:user'
    'model:contact'
    'model:address'
    'model:snapshotCurrency'
    'model:tax'
    'model:file'
    'model:email'
    'model:phone'
    'model:group'
    'model:specificPermission'
    'model:userSettings'
    'model:exchangeRate'
    'model:currency'
    'model:item'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

# test 'displayQuotationDate property should format the quotationDate', ->
#   expect(2)
#   store = @store()

#   Em.run ->
#     payment = store.createRecord 'payment'
#     store.adapterForType(Vosae.QuotationRevision).load store, Vosae.QuotationRevision, {id: 1, quotation_date: "2013-07-17T14:51:37+02:00"}
#     quotationRevision = store.find Vosae.QuotationRevision, 1

#     equal quotationRevision.get('displayQuotationDate'), "July 17 2013"

#     quotationRevision.set 'quotationDate', null

#     equal quotationRevision.get('displayQuotationDate'), "undefined"

# test 'displayQuotationValidity property should format the quotationValidity', ->
#   store.adapterForType(Vosae.QuotationRevision).load store, Vosae.QuotationRevision, {id: 1, quotation_validity: "2013-07-17T14:51:37+02:00"}
#   quotationRevision = store.find Vosae.QuotationRevision, 1

#   equal quotationRevision.get('displayQuotationValidity'), "July 17 2013"

#   quotationRevision.set 'quotationValidity', null

#   equal quotationRevision.get('displayQuotationValidity'), "undefined"

# test 'displayInvoicingDate property should format the invoicingDate', ->
#   store.adapterForType(Vosae.InvoiceRevision).load store, Vosae.InvoiceRevision, {id: 1, invoicing_date: "2013-07-17T14:51:37+02:00"}
#   invoiceRevision = store.find Vosae.InvoiceRevision, 1

#   equal invoiceRevision.get('displayInvoicingDate'), "July 17 2013"

#   invoiceRevision.set 'invoicingDate', null

#   equal invoiceRevision.get('displayInvoicingDate'), "undefined"

# test 'displayCreditNoteEmissionDate property should format the creditNoteEmissionDate', ->
#   store.adapterForType(Vosae.CreditNoteRevision).load store, Vosae.CreditNoteRevision, {id: 1, credit_note_emission_date: "2013-07-17T14:51:37+02:00"}
#   creditNoteRevision = store.find Vosae.CreditNoteRevision, 1

#   equal creditNoteRevision.get('displayCreditNoteEmissionDate'), "July 17 2013"

#   creditNoteRevision.set 'creditNoteEmissionDate', null

#   equal creditNoteRevision.get('displayCreditNoteEmissionDate'), "undefined"

# test 'displayPurchaseOrderDate property should format the purchaseOrderDate', ->
#   store.adapterForType(Vosae.PurchaseOrderRevision).load store, Vosae.PurchaseOrderRevision, {id: 1, purchase_order_date: "2013-07-17T14:51:37+02:00"}
#   purchaseOrderRevision = store.find Vosae.PurchaseOrderRevision, 1

#   equal purchaseOrderRevision.get('displayPurchaseOrderDate'), "July 17 2013"

#   purchaseOrderRevision.set 'purchaseOrderDate', null

#   equal purchaseOrderRevision.get('displayPurchaseOrderDate'), "undefined"

# test 'displayDueDate property should format the dueDate', ->
#   store.adapterForType(Vosae.InvoiceRevision).load store, Vosae.InvoiceRevision, {id: 1}
#   invoiceRevision = store.find Vosae.InvoiceRevision, 1

#   equal invoiceRevision.get('displayDueDate'), "undefined"

#   invoiceRevision.set 'customPaymentConditions', "30 days"

#   equal invoiceRevision.get('displayDueDate'), "variable"

#   invoiceRevision.set 'dueDate', (new Date(2013, 6, 17))

#   equal invoiceRevision.get('displayDueDate'), "variable (July 17 2013)"

#   invoiceRevision.set 'customPaymentConditions', null

#   equal invoiceRevision.get('displayDueDate'), "July 17 2013"

test 'property - total', ->
  expect(3)
  store = @store()

  Em.run ->
    baseRevision = store.createRecord 'baseRevision'
    equal baseRevision.get('total'), 0, "total should return 0 without line items"

    baseRevision.get('lineItems').addObject store.createRecord('lineItem', {unitPrice: 10.46, quantity: 2, optional: true})
    equal baseRevision.get('total'), 0, "total should ignore optional line items"

    baseRevision.get('lineItems').objectAt(0).set('optional', false)
    baseRevision.get('lineItems').addObject store.createRecord('lineItem', {unitPrice: 5.30, quantity: 10})
    equal baseRevision.get('total'), 73.92, "total should add the total of each lineItems"

test 'property - totalPlusTax', ->
  expect(3)
  store = @store()

  Em.run ->
    tax1 = store.createRecord 'tax', {rate: 0.10}
    tax2 = store.createRecord 'tax', {rate: 0.20}
    baseRevision = store.createRecord 'baseRevision'
    equal baseRevision.get('totalPlusTax'), 0, "totalPlusTax total should return 0 without line items"

    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {unitPrice: 10.46, quantity: 2, tax: tax1, optional: true}))
    equal baseRevision.get('totalPlusTax'), 0, "totalPlusTax should ignore optional line items"

    baseRevision.get('lineItems').objectAt(0).set('optional', false)
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {unitPrice: 5.30, quantity: 10, tax: tax2}))
    equal baseRevision.get('totalPlusTax'), 86.612, "totalPlusTax should add the total with taxes of each lineItems"

test 'property - displayTotal', ->
  expect(1)
  store = @store()

  Em.run ->
    baseRevision = store.createRecord 'baseRevision'
    baseRevision.get('lineItems').addObject store.createRecord('lineItem', {unitPrice: 10.46, quantity: 2})
    baseRevision.get('lineItems').addObject store.createRecord('lineItem', {unitPrice: 5.30, quantity: 10})
    equal baseRevision.get('displayTotal'), "$73.92", "displayTotal should format and round the total"

test 'property - displayTotalPlusTax', ->
  expect(1)
  store = @store()

  Em.run ->
    tax1 = store.createRecord 'tax', {rate: 0.10}
    tax2 = store.createRecord 'tax', {rate: 0.20}
    baseRevision = store.createRecord 'baseRevision'
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {unitPrice: 10.46, quantity: 2, tax: tax1}))
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {unitPrice: 5.30, quantity: 10, tax: tax2}))
    equal baseRevision.get('displayTotalPlusTax'), "$86.61", "displayTotalPlusTax should format and round the totalPlusTax"

test 'property - taxes', ->
  expect(5)
  store = @store()

  Em.run ->
    tax1 = store.createRecord 'tax', {id: 1, rate: 0.10}
    tax2 = store.createRecord 'tax', {id: 2, rate: 0.20}
    baseRevision = store.createRecord 'baseRevision'
    taxes = baseRevision.get('taxes')
    equal Em.isEmpty(taxes), true, "taxes should return an empty array by default"

    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {unitPrice: 10, quantity: 1, tax: tax1}))
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {unitPrice: 4, quantity: 2, tax: tax1}))
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {unitPrice: 5, quantity: 4, tax: tax2}))

    taxes = baseRevision.get('taxes')
    equal taxes.objectAt(0).total, 1.8,
    equal taxes.objectAt(0).tax.get('id'), tax1.get('id')
    equal taxes.objectAt(1).total, 4
    equal taxes.objectAt(1).tax.get('id'), tax2.get('id')

test 'method - getLineItemIndex', ->
  expect(2)
  store = @store()

  Em.run ->
    baseRevision = store.createRecord 'baseRevision'
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {id: 1, itemId: "1"}))
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {id: 3, itemId: "3"}))
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {id: 2, itemId: "2"}))
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {id: 4, itemId: "1"}))

    unusedLineItem = store.createRecord 'lineItem'
    equal baseRevision.getLineItemIndex(unusedLineItem), undefined, "getLineItemIndex method should return undefined if the given line item isn't part of the lineItems hasMany"

    store.find('lineItem', 2).then (lineItem) ->
      equal baseRevision.getLineItemIndex(lineItem), 2, "getLineItemIndex method should return the position the given line item in the lineItems hasMany"

test 'method - _getLineItemsReferences', ->
  expect(2)
  store = @store()

  Em.run ->
    baseRevision = store.createRecord 'baseRevision'
    equal Em.isEmpty(baseRevision._getLineItemsReferences()), true, "_getLineItemsReferences should return an empty array by default"

    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {itemId: "1"}))
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {itemId: "3"}))
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {itemId: "2"}))
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {itemId: "1"}))

    deepEqual baseRevision._getLineItemsReferences(), ["1", "3", "2"], "_getLineItemsReferences should return an array of itemID related to the lineItems"

test 'method - _userOverrodeUnitPrice()', ->
  expect(4)
  store = @store()

  Em.run ->
    snapshotCurrencyEUR = store.createRecord 'snapshotCurrency', {symbol: "EUR"}
    snapshotCurrencyEUR.get('rates').addObject(store.createRecord('exchangeRate', {currencyTo: "EUR", rate: 1.00}))
    snapshotCurrencyEUR.get('rates').addObject(store.createRecord('exchangeRate', {currencyTo: "USD", rate: 2.00}))
    itemCurrency = store.createRecord 'currency', {symbol: "EUR"}
    item = store.createRecord 'item', {unitPrice: 10, currency: itemCurrency}
    baseRevision = store.createRecord 'baseRevision', {currency: snapshotCurrencyEUR}
    baseRevision.get('lineItems').addObject(store.createRecord('lineItem', {itemId: "1", unitPrice: 10}))

    lineItem = baseRevision.get('lineItems').objectAt(0)
    baseRevisionCurrency = baseRevision.get('currency')

    equal baseRevision._userOverrodeUnitPrice(lineItem, item, baseRevisionCurrency), false

    lineItem.set 'unitPrice', 20
    equal baseRevision._userOverrodeUnitPrice(lineItem, item, baseRevisionCurrency), true

    itemCurrency.set 'symbol', 'USD'
    lineItem.set 'unitPrice', 5
    equal baseRevision._userOverrodeUnitPrice(lineItem, item, baseRevisionCurrency), false

    lineItem.set 'unitPrice', 10
    equal baseRevision._userOverrodeUnitPrice(lineItem, item, baseRevisionCurrency), true, "_userOverrodeUnitPrice method should return true if orginial unit price has been overrode"

# test '_convertLineItemsPrice() method should return true if orginial unit price has been overrode', ->
#   store.adapterForType(Vosae.Currency).load store, Vosae.Currency,
#     id: 1
#     symbol: "EUR"
#     rates: [
#       {currency_to: "EUR", rate: "1.00"}
#       {currency_to: "USD", rate: "2.00"}
#     ]
#   store.adapterForType(Vosae.Currency).load store, Vosae.Currency,
#     id: 2
#     symbol: "USD"
#     rates: [
#       {currency_to: "EUR", rate: "0.50"}
#       {currency_to: "USD", rate: "1.00"}
#     ]
#   store.adapterForType(Vosae.Item).load store, Vosae.Item, {id:1, unit_price: 10, currency: "/api/v1/currency/1/"}
#   store.adapterForType(Vosae.Item).load store, Vosae.Item, {id:2, unit_price: 8, currency: "/api/v1/currency/1/"}
#   store.adapterForType(Vosae.Item).load store, Vosae.Item, {id:3, unit_price: 57, currency: "/api/v1/currency/2/"}
#   store.adapterForType(Vosae.InvoiceRevision).load store, Vosae.InvoiceRevision,
#     id: 1
#     currency: {
#       symbol: "EUR"
#       rates: [
#         {currency_to: "EUR", rate: "1.00"}
#         {currency_to: "USD", rate: "2.00"}
#       ]
#     }
#     line_items: [
#       {item_id: "1", unit_price: 10}
#       {item_id: "2", unit_price: 4}
#       {item_id: "3", unit_price: 91}
#       {item_id: "3", unit_price: 28.50}
#     ]
#   invoiceRevision = store.find Vosae.InvoiceRevision, 1
#   currentCurrency = invoiceRevision.get('currency')
#   newCurrency = store.find Vosae.Currency, 2
#   invoiceRevision._convertLineItemsPrice(currentCurrency, newCurrency)
#   lineItems = invoiceRevision.get('lineItems')

#   equal lineItems.objectAt(0).get('unitPrice'), 20
#   equal lineItems.objectAt(1).get('unitPrice'), 8
#   equal lineItems.objectAt(2).get('unitPrice'), 182
#   equal lineItems.objectAt(3).get('unitPrice'), 57
#   equal invoiceRevision.get('currency.symbol'), "USD"
#   equal invoiceRevision.get('currency.rates').toArray(), newCurrency.get('rates').toArray()

#   currentCurrency = invoiceRevision.get('currency')
#   newCurrency = store.find Vosae.Currency, 1
#   invoiceRevision._convertLineItemsPrice(currentCurrency, newCurrency)
#   lineItems = invoiceRevision.get('lineItems')

#   equal lineItems.objectAt(0).get('unitPrice'), 10
#   equal lineItems.objectAt(1).get('unitPrice'), 4
#   equal lineItems.objectAt(2).get('unitPrice'), 91
#   equal lineItems.objectAt(3).get('unitPrice'), 28.50
#   equal invoiceRevision.get('currency.symbol'), "EUR"
#   equal invoiceRevision.get('currency.rates').toArray(), newCurrency.get('rates').toArray()

# test 'updateWithCurrency() method should update the invoiceRevision with the new currency', ->
#   store.adapterForType(Vosae.Currency).load store, Vosae.Currency,
#     id: 1
#     symbol: "EUR"
#     rates: [
#       {currency_to: "EUR", rate: "1.00"}
#       {currency_to: "USD", rate: "2.00"}
#     ]
#   store.adapterForType(Vosae.Currency).load store, Vosae.Currency,
#     id: 2
#     symbol: "USD"
#     rates: [
#       {currency_to: "EUR", rate: "0.50"}
#       {currency_to: "USD", rate: "1.00"}
#     ]
#   store.adapterForType(Vosae.Item).load store, Vosae.Item, {id:1, unit_price: 10, currency: "/api/v1/currency/1/"}
#   store.adapterForType(Vosae.Item).load store, Vosae.Item, {id:2, unit_price: 57, currency: "/api/v1/currency/2/"}
#   item1 = store.find Vosae.Item, 1
#   item2 = store.find Vosae.Item, 2
#   store.adapterForType(Vosae.InvoiceRevision).load store, Vosae.InvoiceRevision,
#     id: 1
#     currency: {
#       symbol: "EUR"
#       rates: [
#         {currency_to: "EUR", rate: "1.00"}
#         {currency_to: "USD", rate: "2.00"}
#       ]
#     }
#     line_items: [
#       {item_id: "1", unit_price: 10}
#       {item_id: "2", unit_price: 91}
#     ]
#   invoiceRevision = store.find Vosae.InvoiceRevision, 1
#   newCurrency = store.find Vosae.Currency, 2
#   invoiceRevision.updateWithCurrency(newCurrency)

#   # The waitFor hook is needed because of the store.findMany() in updateWithCurrency()
#   waitsFor ->
#     return invoiceRevision.get('currency.symbol') is "USD" # At this point we know updateWithCurrency() is done
#   , "", 750

#   runs ->
#     lineItems = invoiceRevision.get('lineItems')

#     equal lineItems.objectAt(0).get('unitPrice'), 20
#     equal lineItems.objectAt(1).get('unitPrice'), 182
#     equal invoiceRevision.get('currency.rates').toArray(), newCurrency.get('rates').toArray()

#     invoiceRevision.set 'lineItems.content', []
#     newCurrency = store.find Vosae.Currency, 1
#     invoiceRevision.updateWithCurrency(newCurrency)

#     equal invoiceRevision.get('currency.symbol'), "EUR"
#     equal invoiceRevision.get('currency.rates').toArray(), newCurrency.get('rates').toArray()
