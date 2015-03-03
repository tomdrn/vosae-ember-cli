`import DS from 'ember-data'`

###
  A data model that represents an entity.
  @class Entity
  @extends DS.Model
###

Entity = DS.Model.extend
  photoSource: DS.attr("string")
  photoUri: DS.attr("string")
  gravatarMail: DS.attr("string")
  note: DS.attr("string")
  status: DS.attr("string")
  private: DS.attr("boolean", defaultValue: false)
  addresses: DS.hasMany("address")
  emails: DS.hasMany("email")
  phones: DS.hasMany("phone")
  creator: DS.belongsTo("user")
  photo: DS.belongsTo("file", async: true)

  isUploading: false

  # Return true if entity has been created by current Vosae.User
  isOwned: (->
    @get('creator') is @get("store.session.user")
  ).property 'creator'

`export default Entity`
