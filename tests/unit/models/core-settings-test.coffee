`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'core-settings', {
  # Specify the other units that are required for this test.
  needs: [
    'model:storageQuotasSettings'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
