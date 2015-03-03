`import Ember from 'ember'`

PolymorphicEmbeddedRecordsMixin = Ember.Mixin.create
  extractEmbeddedFromBelongsTo: (store, key, relationship, payload, config) ->
    serializer = store.serializerFor(relationship.type.typeKey)
    primaryKey = Ember.get(this, 'primaryKey')
    key = if config.key then config.key else @keyForAttribute(key)
    if !payload[key]
      return
    data = payload[key]

    # Don't try to process data if it's not data!
    if serializer.isResourceUri(store.adapterFor(relationship.type.typeKey), data)
      return

    # In case of polymorphic relation, the embeddedType should be different.
    if relationship.hasOwnProperty('options') and relationship.options.polymorphic == true
      embeddedType = store.modelFor(payload[relationship.type.typeKey + 'Type'])
    else
      embeddedType = store.modelFor(relationship.type.typeKey)

    serializer.extractEmbeddedFromPayload store, embeddedType, data
    data = serializer.normalize(embeddedType, data, embeddedType.typeKey)
    payload[key] = serializer.relationshipToResourceUri(relationship, data)
    store.push embeddedType, data

`export default PolymorphicEmbeddedRecordsMixin`
