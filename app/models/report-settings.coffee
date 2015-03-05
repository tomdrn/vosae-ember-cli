`import DS from 'ember-data'`
`import Ember from 'ember'`
`import vosaeSettings from 'vosae/conf/settings'`

inflector = Ember.Inflector.inflector
inflector.irregular 'reportSettings', 'reportSettings'

###
 * A model that represents settings for reports.
 * @class ReportSettings
 * @extends DS.Model
###

ReportSettings = DS.Model.extend
  fontName: DS.attr("string", defaultValue: 'bariol')
  fontSize: DS.attr("number")
  fontColor: DS.attr("string")
  baseColor: DS.attr("string")
  paperSize: DS.attr("string")
  forceBw: DS.attr("boolean")
  language: DS.attr("string")

  defaultLanguage: (->
    vosaeSettings.languages.findProperty('code', @get('language'))
  ).property('language')

  otherLanguages: (->
    defaultLang = @get('language')
    vosaeSettings.languages.filter (language)->
      if language.get('code') != defaultLang
        return language
  ).property('language')

`export default ReportSettings`
