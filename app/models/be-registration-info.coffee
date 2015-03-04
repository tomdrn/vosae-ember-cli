`import DS from 'ember-data'`
`import RegistrationInfo from 'vosae-web-new/models/registration-info'`
`import EuRegistrationInfoMixin from 'vosae-web-new/mixins/eu-registration-info'`

###
  A data model that represents registration informations for Belgium.
  @class BeRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfoMixin
###

BeRegistrationInfo = RegistrationInfo.extend EuRegistrationInfoMixin,
  countryCode: 'BE'

`export default BeRegistrationInfo`
