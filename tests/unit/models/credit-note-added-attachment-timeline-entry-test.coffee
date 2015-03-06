`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'credit-note-added-attachment-timeline-entry', {
  # Specify the other units that are required for this test.
  needs: [
    'model:file'
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
