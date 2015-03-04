`import { test, moduleForModel } from 'ember-qunit'`
`import Group from 'vosae-web-new/models/group'`
`import SpecificPermission from 'vosae-web-new/models/specific-permission'`
`import UserSettings from 'vosae-web-new/models/user-settings'`

moduleForModel 'user', {
  # Specify the other units that are required for this test.
  needs: [
    'model:group'
    'model:userSettings'
    'model:specificPermission'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'relationship - group', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'group', {id: 1, name: 'Admin'}
    store.push 'user', {id: 1, groups: [1]}

    store.find('user', 1).then (user) ->
      equal user.get('groups').objectAt(0) instanceof Group, true, "the first object in the groups property should return group"
      equal user.get('groups').objectAt(0).get('name'), "Admin", "the first group in groups should have a name"

test 'relationship - specificPermissions', ->
  expect(3)
  store = @store()

  Em.run ->
    store.push 'specificPermission', {id: 1, name: "can_edit_contact", value: true}
    store.push 'user', {id: 1, specificPermissions:[1]}

    store.find('user', 1).then (user) ->
      equal user.get('specificPermissions').objectAt(0) instanceof SpecificPermission, true, "the first object in the specificPermissions property should return specific permission"
      equal user.get('specificPermissions').objectAt(0).get('name'), "can_edit_contact", "the specific permission should have a name"
      equal user.get('specificPermissions').objectAt(0).get('value'), true, "the specific permission should have a value"

test 'relationship - settings', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'userSettings', {id: 1, languageCode: 'fr'}
    store.push 'user', {id: 1, settings: 1}

    store.find('user', 1).then (user) ->
      equal user.get('settings') instanceof UserSettings, true, "the settings property should return a user settings"
      equal user.get('settings.languageCode'), "fr", "the user settings should have a language code"

test 'method - permissionsContains', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'user', {id: 1, permissions:['can_edit_contact']}

    store.find('user', 1).then (user) ->
      equal user.permissionsContains('can_edit_contact'), true, "permissionsContains should return true if user has the permission"
      equal user.permissionsContains('can_edit_organization'), false, "permissionsContains should return false if user hasnt the permission"

test 'method - specificPermissionsContains', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'specificPermission', {id: 1, name: "can_edit_contact", value: true}
    store.push 'user', {id: 1, specificPermissions:[1]}

    store.find('user', 1).then (user) ->
      equal user.specificPermissionsContains('can_edit_contact'), true, "specificPermissionsContains should return true if user has the permission"
      equal user.specificPermissionsContains('can_edit_organization'), false, "specificPermissionsContains should return false if user hasnt the permission"

test 'method - mergeGroupsPermissions', ->
  expect(4)
  store = @store()

  Em.run ->
    store.push 'group', {id: 1, permissions:['can_edit_contact', 'can_add_quotation']}
    store.push 'group', {id: 2, permissions:['can_edit_organization', 'can_edit_contact']}
    store.push 'user', {id: 1,  groups: [1, 2]}

    store.find('user', 1).then (user) ->
      Em.RSVP.all([store.find('group', 1), store.find('group', 2)]).then (groups) ->
        user.mergeGroupsPermissions()
        equal user.get('permissions').get('length'), 3, "user permissions array's length should be 3"
        equal user.permissionsContains('can_edit_contact'), true, "user should have the permission can_edit_contact"
        equal user.permissionsContains('can_edit_organization'), true, "user should have the permission can_edit_organization"
        equal user.permissionsContains('can_add_quotation'), true, "user should have the permission can_add_quotation"

test 'property - permissions', ->
  expect(1)
  store = @store()

  Em.run ->
    store.push 'user', {id: 1}

    store.find('user', 1).then (user) ->
      deepEqual user.get('permissions'), [], "the default value for the permissions property should be an empty array"

test 'computedProperty - getStatus', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'user', {id: 1, status: 'ACTIVE'}

    store.find('user', 1).then (user) ->
      equal user.get('getStatus'), "Active", "the getStatus property should return the user's status"
      user.set 'status', 'SOMETHINGWRONG'
      equal user.get('getStatus'), 'Unknown', "the getStatus property should return 'Unknown' if the user's status doesn't exist"

test 'computedProperty - getFullName', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'user', {id: 1, fullName: 'Thomas Durin'}

    store.find('user', 1).then (user) ->
      equal user.get('getFullName'), "Thomas Durin", "the getFullName property should return the user's full name"
      user.set 'fullName', ''
      equal user.get('getFullName'), "To define", "the getFullName property should return 'To define' if the user's full name doesn't exist"

test 'computedProperty - isDeleteable', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'user', {id: 1, status: 'DELETED'}

    store.find('user', 1).then (user) ->
      equal user.get('isDeleteable'), false, "the isDeleteable property should false if the user already has the deleted status"
      user.set 'status', ''
      equal user.get('isDeleteable'), true, "the isDeleteable property should true if the user hasn't the deleted status"
