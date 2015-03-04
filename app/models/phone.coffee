`import DS from 'ember-data'`
`import vosaeSettings from 'vosae-web-new/conf/settings'`

###
 * A data model that represents a phone.
 * @class Phone
 * @extends DS.Model
###

Phone = DS.Model.extend
  type: DS.attr("string", defaultValue: 'WORK')
  subtype: DS.attr("string")
  phone: DS.attr("string")

  ###
   * Return true if phone type is 'WORK'.
   * @return {Boolean}
  ###
  typeIsWork: (->
    @get("type") is "WORK"
  ).property("type")

  ###
   * Return true if phone type is 'HOME'.
   * @return {Boolean}
  ###
  typeIsHome: (->
    @get("type") is "HOME"
  ).property("type")

  ###
   * TODO format phone number according to his country.
   * @return {String}
  ###
  displayPhone: (->
    @get("phone")
  ).property("phone")

  ###
   * Return combined types.
   * @return {String}
  ###
  combinedType: (->
    type = @get("type")
    subtype = @get("subtype")
    if type then combined += "#{type}"
    if subtype then combined += "-#{subtype}"
    combined or ""
  ).property("type", "subtype")

  ###
   * Display the combined type.
   * @return {String}
  ###
  displayCombinedType: (->
    obj = vosaeSettings.phoneCombinedTypes.findProperty('value', @get("combinedType"))
    if obj then obj.get('name') else ''
  ).property("combinedType")

  ###
   * Set type and subtype from a combined type.
   * @param  {String} string
   * @return {}
  ###
  combinedTypeChanged: (string) ->
    obj = vosaeSettings.phoneCombinedTypes.findProperty('value', string)
    if obj
      @set "type", obj.get("type")
      @set "subtype", obj.get("subtype")
    else
      @set "type", null
      @set "subtype", null

  getErrors: ->
    errors = []
    unless @get('phone')
      errors.addObject "Phone field must not be blank"
    return errors

`export default Phone`
