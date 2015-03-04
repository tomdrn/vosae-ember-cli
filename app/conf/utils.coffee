###
 * General utility functions for the Vosae application.
 * @object vosaeUtils
###

vosaeUtils =

  ###
   * Configure the i18n according to the language
   * @param {String} language
  ###
  setLanguage: (language) ->
    # TODO : Set language in session
    moment.locale language
    return

`export default vosaeUtils`
