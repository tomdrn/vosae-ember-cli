`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'storage-quotas-settings', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'computed property - usedSpacePercent', ->
  expect(1)
  store = @store()

  Em.run ->
    storageQuotasSettings = store.createRecord "storageQuotasSettings", {allocatedSpace: 20, usedSpace: 5}
    equal storageQuotasSettings.get('usedSpacePercent'), 25, "usedSpacePercent should return a percentage"
