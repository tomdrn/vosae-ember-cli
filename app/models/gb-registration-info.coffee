`import DS from 'ember-data'`
`import RegistrationInfo from 'vosae/models/registration-info'`
`import EuRegistrationInfoMixin from 'vosae/mixins/eu-registration-info'`

###
  A data model that represents registration informations for Grand Britain.
  @class GbRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfo
###

GbRegistrationInfo = RegistrationInfo.extend EuRegistrationInfoMixin,
  countryCode: 'GB'

`export default GbRegistrationInfo`
