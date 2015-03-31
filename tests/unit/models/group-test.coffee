`import { test, moduleForModel } from 'ember-qunit'`
`import User from 'vosae/models/user'`

moduleForModel 'group', {
  # Specify the other units that are required for this test.
  needs: [
    'model:user'
    'model:userSettings'
    'model:specificPermission'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'relationship - createdBy', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'user', {id: 1, fullName: 'Thomas Durin'}
    store.push 'group', {id: 1, createdBy: 1}

    store.find('group', 1).then (group) ->
      equal group.get('createdBy') instanceof User, true, "the createdBy property should return a user"
      equal group.get('createdBy.fullName'), "Thomas Durin", "the user should have a name"

test 'method - loadPermissionsFromGroup', ->
  expect(1)
  store = @store()

  Em.run ->
    store.push 'group', {id: 1, permissions: ['can_edit_organization']}
    store.push 'group', {id: 2, permissions: []}

    # Test
    Em.RSVP.all([store.find('group', 1), store.find('group', 2)]).then (groups) ->
      groups[1].loadPermissionsFromGroup groups[0]
      deepEqual groups[1].get('permissions'), ['can_edit_organization'], "permissions should have be loaded from another group"
