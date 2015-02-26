`import Ember from 'ember'`
`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'address', {
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'has default value for property `type`', (assert) ->
  store = @store()
  Ember.run ->
    address = store.createRecord 'address'
    assert.equal address.get('type'), "WORK", "default `type` should be `WORK`"

test 'method `recordIsEmpty()` should work', (assert) ->
  store = @store()
  Ember.run ->
    address = store.createRecord 'address'
    assert.equal address.recordIsEmpty(), true, "recordIsEmpty() should return true if address is empty"

    address.set 'streetAddress', 'SomeContent'
    assert.equal address.recordIsEmpty(), false, "recordIsEmpty() should return false if address isn't empty"

test 'method `dumpDatafrom()` should work', (assert) ->
  store = @store()
  Ember.run ->
    address = store.createRecord 'address'
    address.setProperties
      type: 'a'
      postofficeBox: 'b'
      streetAddress: 'c'
      extendedAddress: 'd'
      postalCode: 'e'
      city: 'f'
      state: 'g'
      country: 'h'

    newAddress = store.createRecord 'address'
    newAddress.dumpDataFrom(address)

    assert.equal newAddress.get('type'), 'a', "attribute `type` should be the same"
    assert.equal newAddress.get('postofficeBox'), 'b', "attribute `postofficeBox` should be the same"
    assert.equal newAddress.get('streetAddress'), 'c', "attribute `streetAddress` should be the same"
    assert.equal newAddress.get('extendedAddress'), 'd', "attribute `extendedAddress` should be the same"
    assert.equal newAddress.get('postalCode'), 'e', "attribute `postalCode` should be the same"
    assert.equal newAddress.get('city'), 'f', "attribute `city` should be the same"
    assert.equal newAddress.get('state'), 'g', "attribute `state` should be the same"
    assert.equal newAddress.get('country'), 'h', "attribute `country` should be the same"
