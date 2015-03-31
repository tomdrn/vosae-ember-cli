`import { test, moduleForModel } from 'ember-qunit'`
`import BeRegistrationInfo from 'vosae/models/be-registration-info'`
`import ChRegistrationInfo from 'vosae/models/ch-registration-info'`
`import FrRegistrationInfo from 'vosae/models/fr-registration-info'`
`import GbRegistrationInfo from 'vosae/models/gb-registration-info'`
`import LuRegistrationInfo from 'vosae/models/lu-registration-info'`
`import UsRegistrationInfo from 'vosae/models/us-registration-info'`

moduleForModel 'registration-info', {
  # Specify the other units that are required for this test.
  needs: [
    'model:beRegistrationInfo'
    'model:chRegistrationInfo'
    'model:frRegistrationInfo'
    'model:gbRegistrationInfo'
    'model:luRegistrationInfo'
    'model:usRegistrationInfo'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'method - registrationInfoFor', ->
  expect(6)
  store = @store()

  Em.run ->
    regisInfo = store.createRecord "registrationInfo", {}
    equal regisInfo.registrationInfoFor('BE'), BeRegistrationInfo, "calling registrationInfoFor with BE should returns class BeRegistrationInfo"
    equal regisInfo.registrationInfoFor('CH'), ChRegistrationInfo, "calling registrationInfoFor with CH should returns class ChRegistrationInfo"
    equal regisInfo.registrationInfoFor('FR'), FrRegistrationInfo, "calling registrationInfoFor with FR should returns class FrRegistrationInfo"
    equal regisInfo.registrationInfoFor('GB'), GbRegistrationInfo, "calling registrationInfoFor with GB should returns class GbRegistrationInfo"
    equal regisInfo.registrationInfoFor('LU'), LuRegistrationInfo, "calling registrationInfoFor with LU should returns class LuRegistrationInfo"
    equal regisInfo.registrationInfoFor('US'), UsRegistrationInfo, "calling registrationInfoFor with US should returns class UsRegistrationInfo"
