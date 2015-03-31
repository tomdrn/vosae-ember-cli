`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'down-payment-invoice-cancelled-timeline-entry', {
  # Specify the other units that are required for this test.
  needs: [
    'model:file'
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
