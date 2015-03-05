`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import PolymorphicEmbeddedRecordsMixin from 'vosae/mixins/polymorphic-embedded-records'`

module 'PolymorphicEmbeddedRecordsMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  PolymorphicEmbeddedRecordsObject = Ember.Object.extend PolymorphicEmbeddedRecordsMixin
  subject = PolymorphicEmbeddedRecordsObject.create()
  assert.ok subject
