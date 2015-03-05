`import DS from 'ember-data'`
`import RegistrationInfo from 'vosae/models/registration-info'`
`import EuRegistrationInfoMixin from 'vosae/mixins/eu-registration-info'`

###
  A data model that represents registration informations for Luxembourg.
  @class LuRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfo
###

LuRegistrationInfo = RegistrationInfo.extend EuRegistrationInfoMixin,
  countryCode: 'LU'

`export default LuRegistrationInfo`
