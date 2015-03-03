`import DS from 'ember-data'`

###
 * A data model that represents an api key.
 * @class ApiKey
 * @extends DS.Model
###

ApiKey = DS.Model.extend
  label: DS.attr('string')
  key: DS.attr('string')
  createdAt: DS.attr('datetime')

`export default ApiKey`
