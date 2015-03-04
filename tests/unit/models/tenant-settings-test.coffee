`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'tenant-settings', {
  # Specify the other units that are required for this test.
  needs: [
    'model:coreSettings'
    'model:invoicingSettings'
    'model:storageQuotasSettings'
    'model:invoicingNumberingSettings'
    'model:currency'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
