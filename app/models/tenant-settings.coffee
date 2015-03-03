`import DS from 'ember-data'`
`import Ember from 'ember'`

inflector = Ember.Inflector.inflector
inflector.irregular 'tenantSettings', 'tenantSettings'

###
 * A data model that represents settings for a tenant.
 * @class TenantSettings
 * @extends DS.Model
###

TenantSettings = DS.Model.extend
  core: DS.belongsTo('coreSettings')
  invoicing: DS.belongsTo('invoicingSettings')

`export default TenantSettings`
