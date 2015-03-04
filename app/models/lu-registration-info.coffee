`import DS from 'ember-data'`
`import RegistrationInfo from 'vosae-web-new/models/registration-info'`
`import EuRegistrationInfoMixin from 'vosae-web-new/mixins/eu-registration-info'`

###
  A data model that represents registration informations for Luxembourg.
  @class LuRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfo
###

LuRegistrationInfo = RegistrationInfo.extend EuRegistrationInfoMixin,
  countryCode: 'LU'

`export default LuRegistrationInfo`
