`import { test, moduleForModel } from 'ember-qunit'`
`import vosaeSettings from 'vosae/conf/settings'`

moduleForModel 'report-settings', {
  # Specify the other units that are required for this test.
  needs: []
}

test 'it exists', (assert) ->
  model = @subject()
  assert.ok !!model

test 'property - fontName', ->
  expect(1)
  store = @store()

  Em.run ->
    store.push 'reportSettings', {id: 1}

    store.find('reportSettings', 1).then (reportSettings) ->
      fontFamily = vosaeSettings.reportFontFamilies.findProperty 'value', reportSettings.get('fontName')
      notEqual fontFamily, undefined, "fontName default value should exist in the supported font families"

test 'computedProperty - defaultLanguage', ->
  expect(1)
  store = @store()

  Em.run ->
    store.push 'reportSettings', {id: 1, language: "fr"}

    store.find('reportSettings', 1).then (reportSettings) ->
      equal reportSettings.get('defaultLanguage'), vosaeSettings.languages.findProperty('code', 'fr'), "defaultLanguage should return the language object according to the country code"

test 'computedProperty - otherLanguages', ->
  expect(1)
  store = @store()

  Em.run ->
    store.push 'reportSettings', {id: 1, language: "fr"}

    store.find('reportSettings', 1).then (reportSettings) ->
      otherLanguages = vosaeSettings.languages.filter (language) ->
        if language.get('code') != "fr"
          return language
      deepEqual reportSettings.get('otherLanguages'), otherLanguages, "otherLanguages should return an array of language without the default language"
