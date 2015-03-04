`import DS from 'ember-data'`
`import RegistrationInfo from 'vosae-web-new/models/registration-info'`
`import EuRegistrationInfoMixin from 'vosae-web-new/mixins/eu-registration-info'`

###
  A data model that represents registration informations for France.
  @class FrRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfoMixin
###

FrRegistrationInfo = RegistrationInfo.extend EuRegistrationInfoMixin,
  countryCode: 'FR'
  siret: DS.attr('string')
  rcsNumber: DS.attr('string')

`export default FrRegistrationInfo`
