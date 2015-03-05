`import { test, moduleForModel } from 'ember-qunit'`
`import Address from 'vosae/models/address'`
`import Email from 'vosae/models/email'`
`import Phone from 'vosae/models/phone'`
`import User from 'vosae/models/user'`
`import File from 'vosae/models/file'`
`import SessionService from 'vosae/services/session'`

moduleForModel 'entity', {
  # Specify the other units that are required for this test.
  needs: [
    'model:address'
    'model:phone'
    'model:email'
    'model:user'
    'model:file'
    'model:group'
    'model:userSettings'
    'model:specificPermission'
    'service:session'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'relationship - addresses', ->
  expect(5)
  store = @store()

  Em.run ->
    store.push 'address', {id: 1, country: 'France'}
    store.push 'entity', {id: 1, addresses: [1]}

    store.find('entity', 1).then (entity) ->
      addresses = entity.get('addresses')
      equal addresses.objectAt(0) instanceof Address, true, "the addresses array's first object should be a vosae address"
      equal addresses.objectAt(0).get('country'), "France", "the address should have a country"

      address = addresses.createRecord()
      equal addresses.get('length'), 2
      deepEqual addresses.objectAt(1), address, "it should be possibile to create a new address"

      addresses.removeObject address
      equal addresses.get('length'), 1, "it should be possibile to remove an address"

test 'relationship - emails', ->
  expect(5)
  store = @store()

  Em.run ->
    store.push 'email', {id: 1, email: 'thomas@email.com'}
    store.push 'entity', {id: 1, emails: [1]}

    store.find('entity', 1).then (entity) ->
      emails = entity.get('emails')
      equal emails.objectAt(0) instanceof Email, true, "the emails array's first object should be a vosae email"
      equal emails.objectAt(0).get('email'), "thomas@email.com", "the email should have an email"

      email = emails.createRecord()
      equal emails.get('length'), 2
      deepEqual emails.objectAt(1), email, "it should be possibile to create a new email"

      emails.removeObject email
      equal emails.get('length'), 1, "it should be possibile to remove an email"

test 'relationship - phones', ->
  expect(5)
  store = @store()

  Em.run ->
    store.push 'phone', {id: 1, phone: '+33034344'}
    store.push 'entity', {id: 1, phones: [1]}

    store.find('entity', 1).then (entity) ->
      phones = entity.get('phones')
      equal phones.objectAt(0) instanceof Phone, true, "the phones array's first object should be a vosae phone"
      equal phones.objectAt(0).get('phone'), "+33034344", "the phone should have an phone"

      phone = phones.createRecord()
      equal phones.get('length'), 2
      deepEqual phones.objectAt(1), phone, "it should be possibile to create a new phone"

      phones.removeObject phone
      equal phones.get('length'), 1, "it should be possibile to remove a phone"

test 'relationship - creator', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'user', {id: 1, fullName: 'Thomas Durin'}
    store.push 'entity', {id: 1, creator: 1}

    store.find('entity', 1).then (entity) ->
      equal entity.get('creator') instanceof User, true, "the creator property should return a user"
      equal entity.get('creator.fullName'), "Thomas Durin", "the creator should have a name"

test 'relationship - photo', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'file', {id: 1, name: 'photo.jpg'}
    store.push 'entity', {id: 1, photo: 1}

    store.find('entity', 1).then (entity) ->
      entity.get('photo').then (photo) ->
        equal photo instanceof File, true, "the photo property should return a file"
        equal photo.get('name'), "photo.jpg", "the photo should have a name"

test 'computedProperty - isOwned', ->
  expect(2)
  store = @store()

  Em.run ->
    user1 = store.createRecord 'user'
    user2 = store.createRecord 'user'

    store.set('sessionService', SessionService.create())
    store.get('sessionService').set('user', user1)
    entity = store.createRecord 'entity', {creator: user1}
    equal entity.get('isOwned'), true, "the session's user and the entity creator should be the same"

    entity.set 'creator', user2
    equal entity.get('isOwned'), false, "the session's user and the entity creator should not be the same"
