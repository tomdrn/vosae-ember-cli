`import DS from 'ember-data'`

###
  Main serializer for the application.

  @class ApplicationSerializer
  @extends DS.RESTSerializer
###

ApplicationSerializer = DS.DjangoTastypieSerializer.extend()


  # ###
  #   Called when the server has returned a payload representing
  #   multiple records, such as in response to a `findAll` or `findQuery`.

  #   Here we transform the payload to match the ember-data conventions.
  #   - Update the payload root : payload.objects -> payload.contacts for example.
  #   - Create fake ids to embedded `belongsTo` and `hasMany` objects. Sideload embedded
  #   `belongsTo` and `hasMany`.

  #   @param {DS.Store} store
  #   @param {subclass of DS.Model} primaryType
  #   @param {Object} payload
  #   @return {Array} The primary array that was returned in response to the original query.
  # ###
  # extractArray: (store, primaryType, payload) ->
  #   1) Update the payload root according to the type
  #   root = @payloadRootForType primaryType, "extractArray"
  #   payload[root] = payload.objects
  #   delete payload.objects

  #   # 2) Update payload, adds fake id to embedded relationship and sideload all embedded belongsTo and hasMany
  #   partials = payload[root]
  #   forEach partials, ((partial) ->
  #     updatePayloadWithEmbedded.call this, store, primaryType, payload, partial
  #     return
  #   ), this

  #   @_super(store, primaryType, payload)
  #   console.log test

  # ###
  #   Returns the expected payload root for a specific type. Pluralize if method
  #   is called by an extractArray.

  #   @param {subclass of DS.Model} primaryType
  #   @param {String} extractMethod, must be "extractArray" or "extractSing"
  #   @returns {String} The payload root for the specified type
  # ###
  # payloadRootForType: (primaryType, extractMethod) ->
  #   payloadRoot = primaryType.typeKey.camelize()
  #   if extractMethod is "extractArray"
  #     return payloadRoot.pluralize()
  #   payloadRoot

`export default ApplicationSerializer`
