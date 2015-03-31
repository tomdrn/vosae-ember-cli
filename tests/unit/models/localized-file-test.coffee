`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'localized-file', {
  # Specify the other units that are required for this test.
  needs: [
    'model:file'
    'model:user'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
