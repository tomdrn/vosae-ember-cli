`import DS from 'ember-data'`
`import ApplicationSerializer from 'vosae/serializers/application'`

###
  Serializer for model `TimelineEntry` and all polymorphic sub models.
  @class TimelineEntrySerializer
  @extends ApplicationSerializer
###

TimelineEntrySerializer = ApplicationSerializer.extend
  ###
   * Return the good primary type according to the given typeKey.
   * @param  {DS.Store} store
   * @param  {String} resourceType
   * @return {DS.Model}
  ###
  getPrimaryTypeFromResourceType: (store, resourceType) ->
    switch resourceType
      when "contact_saved_te"
        store.modelFor("contactSavedTimelineEntry")
      when "organization_saved_te"
        store.modelFor("organizationSavedTimelineEntry")
      when "quotation_saved_te"
        store.modelFor("quotationSavedTimelineEntry")
      when "invoice_saved_te"
        store.modelFor("invoiceSavedTimelineEntry")
      when "down_payment_invoice_saved_te"
        store.modelFor("downPaymentInvoiceSavedTimelineEntry")
      when "credit_note_saved_te"
        store.modelFor("creditNoteSavedTimelineEntry")
      when "quotation_changed_state_te"
        store.modelFor("quotationChangedStateTimelineEntry")
      when "invoice_changed_state_te"
        store.modelFor("invoiceChangedStateTimelineEntry")
      when "down_payment_invoice_changed_state_te"
        store.modelFor("downPaymentInvoiceChangedStateTimelineEntry")
      when "credit_note_changed_state_te"
        store.modelFor("creditNoteChangedStateTimelineEntry")
      when "quotation_added_attachment_te"
        store.modelFor("quotationAddedAttachmentTimelineEntry")
      when "invoice_added_attachment_te"
        store.modelFor("invoiceAddedAttachmentTimelineEntry")
      when "down_payment_invoice_added_attachment_te"
        store.modelFor("downPaymentInvoiceAddedAttachmentTimelineEntry")
      when "credit_note_added_attachment_te"
        store.modelFor("creditNoteAddedAttachmentTimelineEntry")
      when "quotation_make_invoice_attachment_te"
        store.modelFor("quotationMakeInvoiceTimelineEntry")
      when "quotation_make_down_payment_invoice_attachment_te"
        store.modelFor("quotationMakeDownPaymentInvoiceTimelineEntry")
      when "invoice_cancelled_te"
        store.modelFor("invoiceCancelledTimelineEntry")
      when "down_payment_invoice_cancelled_te"
        store.modelFor("downPaymentInvoiceCancelledTimelineEntry")
      else
        undefined

  ###
   * Before pushing records to the store, we have must get the
   * good primaryType according to the record's resource type.
  ###
  extractArray: (store, primaryType, payload) ->
    records = []

    payload.objects.forEach (hash) =>
      tePrimaryType = @getPrimaryTypeFromResourceType(store, hash.resource_type)
      delete hash.resource_type
      if tePrimaryType
        @extractEmbeddedFromPayload store, tePrimaryType, hash
        records.push @normalize(tePrimaryType, hash, tePrimaryType.typeKey)

    return records

`export default TimelineEntrySerializer`
