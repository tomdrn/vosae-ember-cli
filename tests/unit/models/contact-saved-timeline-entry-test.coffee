`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'contact-saved-timeline-entry', {
  # Specify the other units that are required for this test.
  needs: [
    'model:contact'
    'model:user'
    'model:organization'
    'model:address'
    'model:email'
    'model:phone'
    'model:file'
    'model:group'
    'model:specificPermission'
    'model:userSettings'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
