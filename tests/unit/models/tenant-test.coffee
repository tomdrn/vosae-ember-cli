`import Ember from 'ember'`
`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'tenant', {
  needs: ['model:address']
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model


test 'it can retrieve belongsTo postalAddress', (assert) ->
  store = @store()

  Ember.run ->
    store.push 'address', {id: 1, city: 'France'}
    store.push 'tenant', {id: 1, postalAddress: 1}

  Ember.run ->
    store.find('tenant', 1).then (tenant) ->
      assert.ok(tenant.get('postalAddress') instanceof DS.Model)
      assert.equal(tenant.get('postalAddress.city'), 'France')
