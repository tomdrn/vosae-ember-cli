`import DS from 'ember-data'`

###
 * A data model that represents a tenant.
 * @class Tenant
 * @extends DS.Model
###

Tenant = DS.Model.extend
  slug: DS.attr("string")
  name: DS.attr("string")
  email: DS.attr("string")
  phone: DS.attr("string")
  fax: DS.attr("string")
  registrationInfo: DS.belongsTo("registrationInfo", polymorphic: true)
  # registrationInfo: DS.belongsTo("registrationInfo")
  reportSettings: DS.belongsTo("reportSettings")
  postalAddress: DS.belongsTo("address")
  billingAddress: DS.belongsTo("address")
  svgLogo: DS.belongsTo("file", async: true)
  imgLogo: DS.belongsTo("file", async: true)
  terms: DS.belongsTo("file", async: true)

`export default Tenant`
