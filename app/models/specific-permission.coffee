`import DS from 'ember-data'`

###
 * A data model that represents a specific permission.
 * @class SpecificPermission
 * @extends DS.Model
###

SpecificPermission = DS.Model.extend
  name: DS.attr("string")
  value: DS.attr("boolean")

`export default SpecificPermission`
