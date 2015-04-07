`import FR from 'vosae/i18n/locale/fr'`

initialize = (container, app) ->
  Em.I18n.locale = 'fr'
  Em.I18n.translations = FR

I18nInitializer =
  name: 'i18n'
  initialize: initialize

`export {initialize}`
`export default I18nInitializer`
