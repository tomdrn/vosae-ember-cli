`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'currency', {
  # Specify the other units that are required for this test.
  needs: [
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model