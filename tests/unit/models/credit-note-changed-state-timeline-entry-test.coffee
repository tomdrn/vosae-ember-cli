`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'credit-note-changed-state-timeline-entry', {
  # Specify the other units that are required for this test.
  needs: [
    'model:user'
    'model:group'
    'model:specificPermission'
    'model:userSettings'
    'model:user'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
