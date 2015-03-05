`import { test, moduleForModel } from 'ember-qunit'`
`import Contact from 'vosae-web-new/models/contact'`

moduleForModel 'organization', {
  # Specify the other units that are required for this test.
  needs: [
    'model:contact'
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
  expect(2)
  store = @store()

  Em.run ->
    organization = store.createRecord 'organization'
    equal organization.getErrors().length, 1, "the getErrors method should return an array with 1 error if the organization has no corporate name"

    organization.set 'corporateName', 'Naeka'
    equal organization.getErrors().length, 0, "the getErrors method should return an empty array if the organization has a corporate name"

test 'relationship - contacts', ->
  expect(5)
  store = @store()

  Em.run ->
    store.push 'contact', {id: 1, name: 'Thomas'}
    store.push 'organization', {id: 1, contacts: [1]}

    store.find('organization', 1).then (organization) ->
      organization.get('contacts').then (contacts) ->
        equal contacts.objectAt(0) instanceof Contact, true, "the contacts array's first object should be a contact"
        equal contacts.objectAt(0).get('name'), "Thomas", "the contact should have an phone"

        contact = contacts.createRecord()
        equal contacts.get('length'), 2
        deepEqual contacts.objectAt(1), contact, "it should be possibile to create a new contact"

        contacts.removeObject contact
        equal contacts.get('length'), 1, "it should be possibile to remove a contact"
