`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'base-revision', {
  # Specify the other units that are required for this test.
  needs: [
    'model:lineItem'
    'model:localizedFile'
    'model:organization'
    'model:user'
    'model:contact'
    'model:address'
    'model:snapshotCurrency'
    'model:tax'
    'model:file'
    'model:email'
    'model:phone'
    'model:group'
    'model:specificPermission'
    'model:userSettings'
    'model:exchangeRate'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model
