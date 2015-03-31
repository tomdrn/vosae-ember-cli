`import DS from 'ember-data'`
`import vosaeSettings from 'vosae/conf/settings'`

###
 * A base model that represents an invoice base.
 * @class InvoiceBase
 * @extends DS.Model
###

InvoiceBase = DS.Model.extend
  reference: DS.attr('string')
  accountType: DS.attr('string')
  total: DS.attr('number')
  amount: DS.attr('number')
  # revisions: DS.hasMany('invoiceRevision')
  notes: DS.hasMany('invoiceNote')
  attachments: DS.hasMany('file', async: true)
  issuer: DS.belongsTo('user', async: true)
  organization: DS.belongsTo('organization', async: true)
  contact: DS.belongsTo('contact', async: true)
  currentRevision: DS.belongsTo('invoiceRevision')
  group: DS.belongsTo('invoiceBaseGroup', {async: true, inverse: null})

  isUploading: false
  isUpdatingState: false
  isGeneratingPdfState: false
  isQuotation: false
  isPurchaseOrder: false
  isInvoice: false
  isDownPaymentInvoice: false
  isCreditNote: false

  relatedColor: (->
    # Returns the related color of current instance,
    # green if `Invoice`, orange if `Quotation`.
    if @get('isQuotation') or @get('isPurchaseOrder')
      return 'primary'
    return 'success'
  ).property()

  canHaveOptionalLineItems: (->
    if @get('isQuotation') or @get('isPurchaseOrder')
      return true
    return false
  ).property()

  displayReceiver: (->
    # Return organization name or contact name.
    if @get('organization') and @get('organization.corporateName')
      return @get('organization.corporateName')
    else if @get('contact') and @get('contact.fullName')
      return @get('contact.fullName')
    return ''
  ).property('organization.corporateName', 'contact.fullName')

  addAttachmentURL: (->
    # Return the url to add attachment
    if @get("id")?
      invoiceBaseAdapter = @get('store').adapterFor(@constructor.typeKey)
      return invoiceBaseAdapter.buildURL(@constructor.typeKey, @get('id')) + "/add_attachment/"
    return
  ).property("id")

  markAsState: (state) ->
    # Set state of `InvoiceBase`.
    if state and @get('id') and not @get('isUpdatingState')
      @set 'isUpdatingState', true
      adapter = @get('store').adapterFor 'invoiceBase'

      # URL to update invoiceBase state
      url = adapter.buildURL @constructor.typeKey, @get('id')
      url += "mark_as_#{state.toLowerCase()}/"

      # Send request to API
      adapter.ajax(url, "PUT").then (json) =>
        @reload()
        @set 'isUpdatingState', false

  downloadPdf: (language) ->
    # if @get("currentRevision.pdf.#{language}")
    #   @get("currentRevision.pdf.#{language}").then (pdf) =>
    #     $.fileDownload(vosaeSettings.APP_ENDPOINT + pdf.get("downloadLink"))
    # else
    if not @get('isGeneratingPdfState')
      @set 'isGeneratingPdfState', true
      adapter = @get('store').adapterFor 'invoiceBase'

      # URL to update invoiceBase state
      url = adapter.buildURL @constructor.typeKey, @get('id')
      url += "generate_pdf/"

      # DIRTY
      $.ajaxSetup()['headers']['X-Report-Language'] = language

      # Send request to API
      adapter.ajax(url, "GET").then (json) =>
        $.fileDownload vosaeSettings.APP_ENDPOINT + json.download_link
        @set 'isGeneratingPdfState', false
        @reload()

      # DIRTY
      delete $.ajaxSetup()['headers']['X-Report-Language']

`export default InvoiceBase`
