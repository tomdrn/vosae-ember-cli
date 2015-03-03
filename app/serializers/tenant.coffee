`import DS from 'ember-data'`
`import Ember from 'ember'`
`import ApplicationSerializer from './application'`
`import PolymorphicEmbeddedRecordsMixin from '../mixins/polymorphic-embedded-records'`

###
  Serializer for model `Tenant`.
  @class TenantSerializer
  @extends ApplicationSerializer
###

TenantSerializer = ApplicationSerializer.extend PolymorphicEmbeddedRecordsMixin,
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
    if payload.objects
      for tenant in payload.objects
        tenant['registrationInfoType'] = Em.String.camelize(tenant.registration_info.resource_type)
        delete tenant.registration_info.resource_type
    return payload

`export default TenantSerializer`
