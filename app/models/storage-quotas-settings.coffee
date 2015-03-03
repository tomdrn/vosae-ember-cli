`import DS from 'ember-data'`
`import Ember from 'ember'`

inflector = Ember.Inflector.inflector
inflector.irregular 'storageQuotasSettings', 'storageQuotasSettings'

###
 * A data model that represents settings for storage quotas.
 * @class StorageQuotasSettings
 * @extends DS.Model
###

StorageQuotasSettings = DS.Model.extend
  allocatedSpace: DS.attr 'number'
  usedSpace: DS.attr 'number'

  usedSpacePercent: (->
    @get('usedSpace') / @get('allocatedSpace') * 100
  ).property('allocatedSpace', 'usedSpace')

`export default StorageQuotasSettings`
