`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'gb-registration-info', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
