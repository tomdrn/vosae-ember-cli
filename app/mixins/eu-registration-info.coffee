`import Ember from 'ember'`

###
  A mixin for registration informations of europeen countries.
  @class EuRegistrationInfoMixin
  @extends Ember.Mixin
###

EuRegistrationInfoMixin = Ember.Mixin.create
  vatNumber: DS.attr('string')

`export default EuRegistrationInfoMixin`
