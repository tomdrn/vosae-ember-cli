`import DS from 'ember-data'`
`import Ember from 'ember'`
`import ApplicationSerializer from 'vosae/serializers/application'`

###
  Serializer for model `Tenant`.
  @class TenantSerializer
  @extends ApplicationSerializer
###

TenantSerializer = ApplicationSerializer.extend DS.EmbeddedRecordsMixin,
  attrs:
    registrationInfo:
      embedded: "always"
    postalAddress:
      embedded: "always"
    billingAddress:
      embedded: "always"
    reportSettings:
      embedded: "always"

  ###
   * Payload must be normalized to make the polymorphism
   * works for the attribute `registrationInfo`.
   * @param  {Array} payload
   * @return {Array} payload
  ###
  normalizePayload: (payload) ->
    if payload.tenants
      for tenant in payload.tenants
        type = tenant.registrationInfo.contentType
        tenant.registrationInfo['type'] = type.substr(0, 2).toLowerCase() + type.substr(2)
        delete tenant.registrationInfo.contentType
    return payload

`export default TenantSerializer`
