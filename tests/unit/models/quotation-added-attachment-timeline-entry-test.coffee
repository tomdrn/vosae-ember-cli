`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'quotation-added-attachment-timeline-entry', {
  # Specify the other units that are required for this test.
  needs: [
    'model:file'
    'model:group'
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
