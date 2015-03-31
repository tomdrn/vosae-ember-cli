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
      when 'BE' then @store.modelFor("BeRegistrationInfo")
      when 'CH' then @store.modelFor("ChRegistrationInfo")
      when 'FR' then @store.modelFor("FrRegistrationInfo")
      when 'GB' then @store.modelFor("GbRegistrationInfo")
      when 'LU' then @store.modelFor("LuRegistrationInfo")
      when 'US' then @store.modelFor("UsRegistrationInfo")

`export default RegistrationInfo`
