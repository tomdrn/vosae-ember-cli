`import DS from 'ember-data'`
`import Ember from 'ember'`

###
  A base model that represents registration informations for all countries.
  @class RegistrationInfo
  @extends DS.Model
###

RegistrationInfo = DS.Model.extend
  businessEntity: DS.attr('string')
  shareCapital: DS.attr('string')


###
  A mixin for registration informations of europeen countries.
  @class EuRegistrationInfo
  @extends Ember.Mixin
  @namespace Vosae
  @module Vosae
###

EuRegistrationInfo = Ember.Mixin.create
  vatNumber: DS.attr('string')


###
  A data model that represents registration informations for Belgium.
  @class BeRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfo
###

BeRegistrationInfo = RegistrationInfo.extend EuRegistrationInfo,
  countryCode: 'BE'


###
  A data model that represents registration informations for Swiss.
  @class ChRegistrationInfo
  @extends RegistrationInfo
###

ChRegistrationInfo = RegistrationInfo.extend
  countryCode: 'CH'
  vatNumber: DS.attr('string')


###
  A data model that represents registration informations for France.
  @class FrRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfo
###

FrRegistrationInfo = RegistrationInfo.extend EuRegistrationInfo,
  countryCode: 'FR'
  siret: DS.attr('string')
  rcsNumber: DS.attr('string')


###
  A data model that represents registration informations for Grand Britain.
  @class GbRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfo
###

GbRegistrationInfo = RegistrationInfo.extend EuRegistrationInfo,
  countryCode: 'GB'


###
  A data model that represents registration informations for Luxembourg.
  @class LuRegistrationInfo
  @extends RegistrationInfo
  @uses EuRegistrationInfo
###

LuRegistrationInfo = RegistrationInfo.extend EuRegistrationInfo,
  countryCode: 'LU'


###
  A data model that represents registration informations for United States.
  @class UsRegistrationInfo
  @extends RegistrationInfo
###

UsRegistrationInfo = RegistrationInfo.extend
  countryCode: 'US'


RegistrationInfo.reopen
  registrationInfoFor: (countryCode) ->
    switch countryCode
      when 'BE' then BeRegistrationInfo
      when 'CH' then ChRegistrationInfo
      when 'FR' then FrRegistrationInfo
      when 'GB' then GbRegistrationInfo
      when 'LU' then LuRegistrationInfo
      when 'US' then UsRegistrationInfo

`export {EuRegistrationInfo, BeRegistrationInfo, ChRegistrationInfo, FrRegistrationInfo, GbRegistrationInfo, LuRegistrationInfo, UsRegistrationInfo}`

