`import Ember from 'ember'`
`import InvoiceMakeableMixin from '../../../mixins/invoice-makeable'`
`import { module, test } from 'qunit'`

module 'InvoiceMakeableMixin',
  setup: ->
    @subject = Ember.Object.createWithMixins InvoiceMakeableMixin,
      id: null
      state: null
      group: Ember.Object.create
        relatedInvoice: null
        downPaymentInvoices: null

test 'it works', (assert) ->
  InvoiceMakeableObject = Ember.Object.extend InvoiceMakeableMixin
  subject = InvoiceMakeableObject.create()
  assert.ok subject

test 'computed property - isInvoiceable', (assert) ->
  expect(2)
  subject = @subject
  assert.equal subject.get('isInvoiceable'), true, "without group related invoice, isInvoiceable should return true"

  subject.set('group.relatedInvoice', true)
  assert.equal subject.get('isInvoiceable'), false, "with a group related invoice, isInvoiceable should return false"

test 'computed property - isModifiable', (assert) ->
  expect(2)
  subject = @subject
  assert.equal subject.get('isModifiable'), true, "without group related invoice, isModifiable should return true"

  subject.set('group.relatedInvoice', true)
  assert.equal subject.get('isModifiable'), false, "with a group related invoice, isModifiable should return false"

test 'computed property - isDeletable', (assert) ->
  expect(4)
  subject = @subject
  subject.set('id', 1)
  subject.get('group').setProperties
    downPaymentInvoices: []
    relatedInvoice: null

  assert.equal subject.get('isDeletable'), true, "without group related invoice and down payment invoices, isDeletable should return true"

  subject.get('group').set('downPaymentInvoices', [1])
  assert.equal subject.get('isDeletable'), false, "with a group down payment invoice, isDeletable should return false"

  subject.get('group').setProperties
    downPaymentInvoices: []
    relatedInvoice: true
  assert.equal subject.get('isDeletable'), false, "with a group related invoice, isDeletable should return false"

  subject.set('id', null)
  subject.set('group.relatedInvoice', null)
  assert.equal subject.get('isDeletable'), false, "without id, isDeletable should return false"

test 'computed property - isInvoiced', (assert) ->
  expect(2)
  subject = @subject
  assert.equal subject.get('isInvoiced'), false, "without state, isInvoiced should return false"
  subject.set('state', 'INVOICED')
  assert.equal subject.get('isInvoiced'), true, "if state is INVOICED, isInvoiced should return true"



