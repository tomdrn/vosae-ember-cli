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
  assert.ok !!model

test 'computed property - displayCreditNoteEmissionDate', ->
  expect(2)
  store = @store()

  Em.run ->
    creditNoteRevision = store.createRecord "creditNoteRevision", {}
    equal creditNoteRevision.get('displayCreditNoteEmissionDate'), "undefined"

    creditNoteRevision.set 'creditNoteEmissionDate', (new Date(2013, 6, 17))
    equal creditNoteRevision.get('displayCreditNoteEmissionDate'), "July 17, 2013"
