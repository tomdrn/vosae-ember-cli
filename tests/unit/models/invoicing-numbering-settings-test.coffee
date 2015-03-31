`import { test, moduleForModel } from 'ember-qunit'`

moduleForModel 'invoicing-numbering-settings', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'computed property - preview', ->
  expect(4)
  store = @store()

  Em.run ->
    invNumbSettings = store.createRecord "invoicingNumberingSettings", {dateFormat: "Ym", scheme: "DN", separator: "-"}
    equal invoicingNumberingSettings.get('preview'), moment().format("YYYYMM") + "-" + "00000"

    invoicingNumberingSettings.set 'separator', ';'
    equal invoicingNumberingSettings.get('preview'), moment().format("YYYYMM") + ";" + "00000"

    invoicingNumberingSettings.set 'dateFormat', 'Ymd'
    equal invoicingNumberingSettings.get('preview'), moment().format("YYYYMMDD") + ";" + "00000"

    invoicingNumberingSettings.set 'scheme', 'N'
    equal invoicingNumberingSettings.get('preview'), "00000"

test 'computed property - schemeIsNumber', ->
  expect(2)
  store = @store()

  Em.run ->
    invNumbSettings = store.createRecord "invoicingNumberingSettings", {scheme: "DN"}
    equal invoicingNumberingSettings.get('schemeIsNumber'), false, "schemeIsNumber should return false if scheme isnt number"

    invoicingNumberingSettings.set 'scheme', 'N'
    equal invoicingNumberingSettings.get('schemeIsNumber'), true, "schemeIsNumber should return true if scheme is number"
