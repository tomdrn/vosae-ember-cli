`import DS from 'ember-data'`

###
 * A data model that represents a group of permissions.
 * @class Group
 * @extends DS.Model
###

Group = DS.Model.extend
  name: DS.attr('string')
  createdAt: DS.attr('datetime')
  permissions: DS.attr('array')
  createdBy: DS.belongsTo('user')

  # This method returns a <Vosae.Permissions> if
  # `permissions` contains the permission name
  # permissionsContains: (perm) ->
  #   if @get('permissions.length')
  #     console.log perm
  #     return @get('permissions').filterProperty('name', perm).get('firstObject')
  #   return false

  # This method load `permissions` from a <Vosae.Group>
  # into the this group.
  loadPermissionsFromGroup: (group) ->
    if group and group.get('permissions')
      @set('permissions', group.get('permissions'))
      @trigger('permissionsHasBeenLoaded')

`export default Group`
