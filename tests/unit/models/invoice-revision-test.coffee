`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'invoice-revision', {
  # Specify the other units that are required for this test.
  needs: [
    'model:lineItem'
    'model:localizedFile'
    'model:organization'
    'model:contact'
    'model:address'
    'model:phone'
    'model:email'
    'model:user'
    'model:snapshotCurrency'
    'model:tax'
    'model:file'
    'model:group'
    'model:specificPermission'
    'model:userSettings'
    'model:user'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
