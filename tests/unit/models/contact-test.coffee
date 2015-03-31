`import { test, moduleForModel } from 'ember-qunit'`
`import Organization from 'vosae/models/organization'`

moduleForModel 'contact', {
  # Specify the other units that are required for this test.
  needs: [
    'model:organization'
    'model:address'
    'model:phone'
    'model:email'
    'model:user'
    'model:file'
    'model:group'
    'model:userSettings'
    'model:specificPermission'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'method - getErrors', ->
  expect(3)
  store = @store()

  Em.run ->
    contact = store.createRecord 'contact'
    equal contact.getErrors().length, 2, "the getErrors method should return an array with 2 errors if the contact has no name and no firstname"

    contact.set 'firstname', 'Tom'
    equal contact.getErrors().length, 1, "the getErrors method should return an array with 1 error if the contact has no name"

    contact.set 'name', 'Dale'
    equal contact.getErrors().length, 0, "the getErrors method should return an empty array if the contact has a name and a firstname"

test 'relationship - organization', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'organization', {id: 1, corporateName: 'Naeka'}
    store.push 'contact', {id: 1, organization: 1}

    store.find('contact', 1).then (contact) ->
      contact.get('organization').then (organization) ->
        equal organization instanceof Organization, true, "the organization property should return an organization"
        equal organization.get('corporateName'), "Naeka", "the organization should have a corporate name"

test 'property - civility', ->
  expect(1)
  store = @store()

  Em.run ->
    contact = store.createRecord "contact"
    equal contact.get('civility'), null, "civility property default value should be null"

test 'computedProperty - fullName', ->
  expect(3)
  store = @store()

  Em.run ->
    contact = store.createRecord "contact"
    equal contact.get('fullName'), '', "fullName property should return an empty string if there's no name and firstname"

    contact.set 'firstname', 'Tom'
    equal contact.get('fullName'), 'Tom', "fullName property should return the firstname if there's no name"

    contact.set 'name', 'Dale'
    equal contact.get('fullName'), 'Tom Dale', "fullName property should concat the name and the firstname"
