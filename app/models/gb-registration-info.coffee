`import DS from 'ember-data'`
`import RegistrationInfo from './registration-info'`
`import EuRegistrationInfoMixin from '../mixins/eu-registration-info'`

###
  A data model that represents registration informations for Grand Britain.
  @class GbRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfo
###

GbRegistrationInfo = RegistrationInfo.extend EuRegistrationInfo,
  countryCode: 'GB'

`export default GbRegistrationInfo`
