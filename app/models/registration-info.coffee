`import DS from 'ember-data'`

###
  A base model that represents registration informations for all countries.
  @class RegistrationInfo
  @extends DS.Model
###

RegistrationInfo = DS.Model.extend
  businessEntity: DS.attr('string')
  shareCapital: DS.attr('string')

RegistrationInfo.reopen
  registrationInfoFor: (countryCode) ->
    switch countryCode
      when 'BE' then BeRegistrationInfo
      when 'CH' then ChRegistrationInfo
      when 'FR' then FrRegistrationInfo
      when 'GB' then GbRegistrationInfo
      when 'LU' then LuRegistrationInfo
      when 'US' then UsRegistrationInfo

`export default RegistrationInfo`
