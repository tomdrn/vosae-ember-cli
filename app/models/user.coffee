`import DS from 'ember-data'`
`import vosaeSettings from 'vosae-web-new/conf/settings'`
`import {gettext} from 'vosae-web-new/utils/i18n'`

###
 * A data model that represents a user.
 * @class User
 * @extends DS.Model
###

User = DS.Model.extend
  email: DS.attr('string')
  fullName: DS.attr('string')
  photoUri: DS.attr('string')
  permissions: DS.attr('array', defaultValue: [])
  groups: DS.hasMany('group')
  specificPermissions: DS.hasMany('specificPermission')
  settings: DS.belongsTo('userSettings')
  status: DS.attr('string')

  getStatus: (->
    statusValue = @get('status')
    statusLabel = vosaeSettings.userStatutes.findProperty('value', statusValue)
    if statusLabel?
      return statusLabel.get('label')
    gettext('Unknown')
  ).property('status')

  getFullName: (->
    fullName = @get('fullName')
    if fullName
      return fullName
    gettext('To define')
  ).property 'fullName'

  isDeleteable: (->
    @get('status') isnt "DELETED"
  ).property 'status'

  # This method returns true if `permissions`
  # array contains the permission `@perm`
  permissionsContains: (perm) ->
    if @get('permissions') and @get('permissions').contains(perm)
      return true
    false

  # This method returns a <Vosae.SpecificPermissions> if
  # `specificPermissions` contains the permission name
  specificPermissionsContains: (perm) ->
    if @get('specificPermissions') and @get('specificPermissions.length')
      permObj = @get('specificPermissions').findProperty('name', perm)
      return permObj.get('value') if permObj
    false

  # This method merged all `groups` permissions
  # into the `permissions` array
  mergeGroupsPermissions: ->
    newPermissions = []

    if @get('groups.length')
      @get('groups').forEach (group) =>
        group.get('permissions').forEach (perm) =>
          if not newPermissions.contains(perm)
            newPermissions.addObject(perm)

          # Check if current permission was in `speficifPermissions`
          # then delete the specificPermission if it was granted
          # because it's now an acquired permission.
          specificPerm = @get('specificPermissions').filterProperty('name', perm).get('firstObject')

          if specificPerm and specificPerm.get('value')
            @get('specificPermissions').removeObject(specificPerm)

    @set('permissions', newPermissions)
    @trigger('groupsHasBeenMerged')

`export default User`
