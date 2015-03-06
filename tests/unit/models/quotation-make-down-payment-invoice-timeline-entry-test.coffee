`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'quotation-make-down-payment-invoice-timeline-entry', {
  # Specify the other units that are required for this test.
  needs: [
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
