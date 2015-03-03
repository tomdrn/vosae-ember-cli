`import DS from 'ember-data'`

###
  Main serializer for the application.

  @class ApplicationSerializer
  @extends DS.RESTSerializer
###

ApplicationSerializer = DS.DjangoTastypieSerializer.extend
  extractArray: (store, primaryType, payload) ->
    payload = @normalizePayload(payload)
    @_super(store, primaryType, payload)

`export default ApplicationSerializer`
