`import DS from 'ember-data'`

###
  A data model that represents a tenant

  @class Tenant
  @extends DS.Model
###

Tenant = DS.Model.extend
  slug: DS.attr("string")
  name: DS.attr("string")
  email: DS.attr("string")
  phone: DS.attr("string")
  fax: DS.attr("string")
  # registrationInfo: DS.belongsTo('Vosae.RegistrationInfo', {polymorphic: true})
  # reportSettings: DS.belongsTo('Vosae.ReportSettings')
  postalAddress: DS.belongsTo("address")
  billingAddress: DS.belongsTo("address")
  # svgLogo: DS.belongsTo("Vosae.File")
  # imgLogo: DS.belongsTo("Vosae.File")
  # terms: DS.belongsTo("Vosae.File")

`export default Tenant`
