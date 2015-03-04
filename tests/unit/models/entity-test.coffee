`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'entity', {
  # Specify the other units that are required for this test.
  needs: [
    'model:address'
    'model:phone'
    'model:email'
    'model:user'
    'model:file'
    'model:group'
    'model:userSettings'
    'model:specificPermission'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
