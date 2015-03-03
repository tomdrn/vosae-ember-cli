`import DS from 'ember-data'`
`import RegistrationInfo from './registration-info'`
`import EuRegistrationInfoMixin from '../mixins/eu-registration-info'`

###
  A data model that represents registration informations for Luxembourg.
  @class LuRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfo
###

LuRegistrationInfo = RegistrationInfo.extend EuRegistrationInfo,
  countryCode: 'LU'

`export default LuRegistrationInfo`
