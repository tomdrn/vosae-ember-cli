`import Ember from 'ember'`
`import { module, test } from 'qunit'`
`import EuRegistrationInfoMixin from 'vosae/mixins/eu-registration-info'`

module 'EuRegistrationInfoMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  EuRegistrationInfoObject = Ember.Object.extend EuRegistrationInfoMixin
  subject = EuRegistrationInfoObject.create()
  assert.ok subject
