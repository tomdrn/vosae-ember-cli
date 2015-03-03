`import Ember from 'ember'`
`import PolymorphicEmbeddedRecordsMixin from '../../../mixins/polymorphic-embedded-records'`
`import { module, test } from 'qunit'`

module 'PolymorphicEmbeddedRecordsMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  PolymorphicEmbeddedRecordsObject = Ember.Object.extend PolymorphicEmbeddedRecordsMixin
  subject = PolymorphicEmbeddedRecordsObject.create()
  assert.ok subject
