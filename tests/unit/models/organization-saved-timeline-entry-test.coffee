`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'organization-saved-timeline-entry', {
  # Specify the other units that are required for this test.
  needs: [
    'model:organization'
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
    'model:contact'
    'model:address'
    'model:phone'
    'model:email'
    'model:file'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
