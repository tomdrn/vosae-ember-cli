`import DS from 'ember-data'`
`import Ember from 'ember'`

inflector = Ember.Inflector.inflector
inflector.irregular 'coreSettings', 'coreSettings'

###
 * A data model that represents settings for core application.
 * @class CoreSettings
 * @extends DS.Model
###

CoreSettings = DS.Model.extend
  quotas: DS.belongsTo('storageQuotasSettings')

`export default CoreSettings`
