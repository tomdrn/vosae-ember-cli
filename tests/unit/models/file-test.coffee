`import { test, moduleForModel } from 'ember-qunit'`
`import User from 'vosae/models/user'`

moduleForModel 'file', {
  # Specify the other units that are required for this test.
  needs: [
    'model:user'
    'model:group'
    'model:userSettings'
    'model:specificPermission'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'relationship - issuer', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'user', {id: 1, fullName: 'Thomas Durin'}
    store.push 'file', {id: 1, issuer: 1}

    store.find('file', 1).then (file) ->
      equal file.get('issuer') instanceof User, true, "the issuer property should return a user"
      equal file.get('issuer.fullName'), "Thomas Durin", "the issuer should have a name"

test 'computedProperty - displayCreatedAt', ->
  expect(1)
  store = @store()

  Em.run ->
    store.push 'file', {id: 1, createdAt: new Date(2011,10,30)}

    store.find('file', 1).then (file) ->
      equal file.get('displayCreatedAt'), "November 30, 2011", "the displayCreatedAt property display the createdAt date"

test 'computedProperty - displayModifiedAt', ->
  expect(1)
  store = @store()

  Em.run ->
    store.push 'file', {id: 1, modifiedAt: new Date(2011,10,30)}

    store.find('file', 1).then (file) ->
      equal file.get('displayModifiedAt'), "November 30, 2011", "the displayModifiedAt property display the modifiedAt date"
