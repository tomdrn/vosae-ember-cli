`import Ember from 'ember'`
`import EuRegistrationInfoMixin from '../../../mixins/eu-registration-info'`
`import { module, test } from 'qunit'`

module 'EuRegistrationInfoMixin'

# Replace this with your real tests.
test 'it works', (assert) ->
  EuRegistrationInfoObject = Ember.Object.extend EuRegistrationInfoMixin
  subject = EuRegistrationInfoObject.create()
  assert.ok subject
