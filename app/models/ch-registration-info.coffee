`import DS from 'ember-data'`
`import RegistrationInfo from './registration-info'`

###
  A data model that represents registration informations for Swiss.
  @class ChRegistrationInfo
  @extends RegistrationInfo
###

ChRegistrationInfo = RegistrationInfo.extend
  countryCode: 'CH'
  vatNumber: DS.attr('string')

`export default ChRegistrationInfo`
