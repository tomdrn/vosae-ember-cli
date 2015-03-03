`import DS from 'ember-data'`

###
  A base model that represents registration informations for all countries.
  @class RegistrationInfo
  @extends DS.Model
###

RegistrationInfo = DS.Model.extend
  businessEntity: DS.attr('string')
  shareCapital: DS.attr('string')

# RegistrationInfo.reopen
#   registrationInfoFor: (countryCode) ->
#     switch countryCode
#       when 'BE' then BeRegistrationInfo
#       when 'CH' then ChRegistrationInfo
#       when 'FR' then FrRegistrationInfo
#       when 'GB' then GbRegistrationInfo
#       when 'LU' then LuRegistrationInfo
#       when 'US' then UsRegistrationInfo


# ###
#   A data model that represents registration informations for Swiss.
#   @class ChRegistrationInfo
#   @extends RegistrationInfo
# ###

# ChRegistrationInfo = RegistrationInfo.extend
#   countryCode: 'CH'
#   vatNumber: DS.attr('string')


# ###
#   A data model that represents registration informations for Grand Britain.
#   @class GbRegistrationInfo
#   @extends RegistrationInfo
#   @uses EuRegistrationInfo
# ###

# GbRegistrationInfo = RegistrationInfo.extend EuRegistrationInfo,
#   countryCode: 'GB'


# ###
#   A data model that represents registration informations for Luxembourg.
#   @class LuRegistrationInfo
#   @extends RegistrationInfo
#   @uses EuRegistrationInfo
# ###

# LuRegistrationInfo = RegistrationInfo.extend EuRegistrationInfo,
#   countryCode: 'LU'


# ###
#   A data model that represents registration informations for United States.
#   @class UsRegistrationInfo
#   @extends RegistrationInfo
# ###

# UsRegistrationInfo = RegistrationInfo.extend
#   countryCode: 'US'

`export default RegistrationInfo`
