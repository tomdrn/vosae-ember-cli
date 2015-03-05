`import DS from 'ember-data'`
`import RegistrationInfo from 'vosae/models/registration-info'`

###
  A data model that represents registration informations for United States.
  @class UsRegistrationInfo
  @extends RegistrationInfo
###

UsRegistrationInfo = RegistrationInfo.extend
  countryCode: 'US'

`export default UsRegistrationInfo`
