`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'contact-group', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
