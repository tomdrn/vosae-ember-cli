`import DS from 'ember-data'`
`import RegistrationInfo from './registration-info'`
`import EuRegistrationInfoMixin from '../mixins/eu-registration-info'`

###
  A data model that represents registration informations for Belgium.
  @class BeRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfoMixin
###

BeRegistrationInfo = RegistrationInfo.extend EuRegistrationInfoMixin,
  countryCode: 'BE'

`export default BeRegistrationInfo`
