`import Ember from 'ember'`
`import InvoiceMakeableMixin from '../../../mixins/invoice-makeable'`
`import { module, test } from 'qunit'`

module 'InvoiceMakeableMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  InvoiceMakeableObject = Ember.Object.extend InvoiceMakeableMixin
  subject = InvoiceMakeableObject.create()
  assert.ok subject
