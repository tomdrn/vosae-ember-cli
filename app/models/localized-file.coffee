`import DS from 'ember-data'`

###
 * A data model that represents a localized file.
 * @class LocalizedFile
 * @extends DS.Model
###

LocalizedFile = DS.Model.extend
  'fr': DS.belongsTo("file")
  'en': DS.belongsTo("file")
  'en-gb': DS.belongsTo("file")

`export default LocalizedFile`
