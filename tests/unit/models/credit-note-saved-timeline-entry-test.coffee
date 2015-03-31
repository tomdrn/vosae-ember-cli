`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'credit-note-saved-timeline-entry', {
  # Specify the other units that are required for this test.
  needs: [
    'model:user'
    'model:userSettings'
    'model:specificPermission'
    'model:group'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
