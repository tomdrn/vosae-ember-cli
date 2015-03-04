`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'invoicing-settings', {
  # Specify the other units that are required for this test.
  needs: [
    'model:currency'
    'model:invoicingNumberingSettings'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
