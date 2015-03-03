`import DS from 'ember-data'`
`import Ember from 'ember'`

inflector = Ember.Inflector.inflector
inflector.irregular 'userSettings', 'userSettings'

###
 * A data model that represents user settings.
 * @class UserSettings
 * @extends DS.Model
###

UserSettings = DS.Model.extend
  languageCode: DS.attr('string')
  emailSignature: DS.attr('string')
  gravatarEmail: DS.attr('string')

`export default UserSettings`
