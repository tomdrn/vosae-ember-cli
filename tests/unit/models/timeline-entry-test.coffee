`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'timeline-entry', {
  # Specify the other units that are required for this test.
  needs: [
    'model:user'
    'model:group'
    'model:specificPermission'
    'model:userSettings'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
