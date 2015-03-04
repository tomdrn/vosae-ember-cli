`import { test, moduleForModel } from 'ember-qunit'`
# `import BeRegistrationInfo from 'vosae-web-new/models/be-registration-info'`
# `import ChRegistrationInfo from 'vosae-web-new/models/ch-registration-info'`
# `import FrRegistrationInfo from 'vosae-web-new/models/fr-registration-info'`
# `import GbRegistrationInfo from 'vosae-web-new/models/gb-registration-info'`
# `import LuRegistrationInfo from 'vosae-web-new/models/lu-registration-info'`
# `import UsRegistrationInfo from 'vosae-web-new/models/us-registration-info'`

moduleForModel 'registration-info', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model


# test 'method - registrationInfoFor', ->
#   expect(6)
#   store = @store()

#   Em.run ->
#     store.push 'registrationInfo', {id: 1}

#     store.find('registrationInfo', 1).then (regisInfo) ->
#       equal regisInfo.registrationInfoFor('BE'), BeRegistrationInfo, "calling registrationInfoFor with BE should returns class BeRegistrationInfo"
#       equal regisInfo.registrationInfoFor('CH'), ChRegistrationInfo, "calling registrationInfoFor with CH should returns class ChRegistrationInfo"
#       equal regisInfo.registrationInfoFor('FR'), FrRegistrationInfo, "calling registrationInfoFor with FR should returns class FrRegistrationInfo"
#       equal regisInfo.registrationInfoFor('GB'), GbRegistrationInfo, "calling registrationInfoFor with GB should returns class GbRegistrationInfo"
#       equal regisInfo.registrationInfoFor('LU'), LuRegistrationInfo, "calling registrationInfoFor with LU should returns class LuRegistrationInfo"
#       equal regisInfo.registrationInfoFor('US'), UsRegistrationInfo, "calling registrationInfoFor with US should returns class UsRegistrationInfo"
