`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'credit-note-revision', {
  # Specify the other units that are required for this test.
  needs: [
    'model:lineItem'
    'model:localizedFile'
    'model:organization'
    'model:address'
    'model:email'
    'model:phone'
    'model:user'
    'model:contact'
    'model:snapshotCurrency'
    'model:tax'
    'model:file'
    'model:group'
    'model:specificPermission'
    'model:userSettings'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  # store = @store()
  assert.ok !!model
