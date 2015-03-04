`import { test, moduleForModel } from 'ember-qunit'`
`import RegistrationInfo from 'vosae-web-new/models/registration-info'`
`import ReportSettings from 'vosae-web-new/models/report-settings'`
`import Address from 'vosae-web-new/models/address'`
`import File from 'vosae-web-new/models/file'`

moduleForModel 'tenant', {
  # Specify the other units that are required for this test.
  needs: [
    'model:registrationInfo'
    'model:reportSettings'
    'model:address'
    'model:file'
    'model:user'
    'model:userSettings'
    'model:group'
    'model:specificPermission'
  ]
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model


test 'relationship - registrationInfo', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'registrationInfo', {id: 1, businessEntity: 'SARL'}
    store.push 'tenant', {id: 1, registrationInfo: 1, registrationInfoType: 'registrationInfo' }

    store.find('tenant', 1).then (tenant) ->
      equal tenant.get('registrationInfo') instanceof RegistrationInfo, true, "the registrationInfo property should return a registration info"
      equal tenant.get('registrationInfo.businessEntity'), "SARL", "the registration info should have a business entity"


test 'relationship - reportSettings', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'reportSettings', {id: 1, fontName: 'bariol'}
    store.push 'tenant', {id: 1, reportSettings: 1}

    store.find('tenant', 1).then (tenant) ->
      equal tenant.get('reportSettings') instanceof ReportSettings, true, "the reportSettings property should return a report settings"
      equal tenant.get('reportSettings.fontName'), "bariol", "the report settings should have a font name"


test 'relationship - postalAddress', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'address', {id: 1, country: 'France'}
    store.push 'tenant', {id: 1, postalAddress: 1}

    store.find('tenant', 1).then (tenant) ->
      equal tenant.get('postalAddress') instanceof Address, true, "the postalAddress property should return an address"
      equal tenant.get('postalAddress.country'), "France", "the postal address should have a country"


test 'relationship - billingAddress', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'address', {id: 1, country: 'France'}
    store.push 'tenant', {id: 1, billingAddress: 1}

    store.find('tenant', 1).then (tenant) ->
      equal tenant.get('billingAddress') instanceof Address, true, "the billingAddress property should return an address"
      equal tenant.get('billingAddress.country'), "France", "the billing address should have a country"


test 'relationship - svgLogo', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'file', {id: 1, name: 'myLogo.svg'}
    store.push 'tenant', {id: 1, svgLogo: 1}

    store.find('tenant', 1).then (tenant) ->
      tenant.get('svgLogo').then (svgLogo) ->
        equal svgLogo instanceof File, true, "the svgLogo property should return a file"
        equal svgLogo.get('name'), "myLogo.svg", "the svg logo should have name"


test 'relationship - imgLogo', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'file', {id: 1, name: 'myImage.png'}
    store.push 'tenant', {id: 1, imgLogo: 1}

    store.find('tenant', 1).then (tenant) ->
      tenant.get('imgLogo').then (imgLogo) ->
        equal imgLogo instanceof File, true, "the imgLogo property should return a file"
        equal imgLogo.get('name'), "myImage.png", "the img logo should have name"


test 'relationship - terms', ->
  expect(2)
  store = @store()

  Em.run ->
    store.push 'file', {id: 1, name: 'myTerms.pdf'}
    store.push 'tenant', {id: 1, terms: 1}

    store.find('tenant', 1).then (tenant) ->
      tenant.get('terms').then (terms) ->
        equal terms instanceof File, true, "the terms property should return a file"
        equal terms.get('name'), "myTerms.pdf", "the terms should have name"
