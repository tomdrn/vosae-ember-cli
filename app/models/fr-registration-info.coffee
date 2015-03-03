`import DS from 'ember-data'`
`import RegistrationInfo from './registration-info'`
`import EuRegistrationInfoMixin from '../mixins/eu-registration-info'`

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
