`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'line-item', {
  # Specify the other units that are required for this test.
  needs: [
    'model:tax'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
