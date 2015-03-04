`import DS from 'ember-data'`

###
 * A data model that represents an address.
 * @class Address
 * @extends DS.Model
###

Address = DS.Model.extend
  type: DS.attr("string", defaultValue: 'WORK')
  postofficeBox: DS.attr('string')
  streetAddress: DS.attr('string')
  extendedAddress: DS.attr('string')
  postalCode: DS.attr('string')
  city: DS.attr('string')
  state: DS.attr('string')
  country: DS.attr('string')
  label: DS.attr('string')
  geoPoint: DS.attr('string')

  ###
   * Dertermine if the address is empty
   * @return {Boolean}
  ###
  recordIsEmpty: ->
    if @get 'postofficeBox'
      return false
    if @get 'streetAddress'
      return false
    if @get 'extendedAddress'
      return false
    if @get 'postalCode'
      return false
    if @get 'city'
      return false
    if @get 'state'
      return false
    if @get 'country'
      return false
    if @get 'label'
      return false
    if @get 'geoPoint'
      return false
    return true

  ###
   * Copy all attr values to the current object.
   * @param  {Address} address - The `Address` from which we will copy attributes value
   * @return {}
  ###
  dumpDataFrom: (address) ->
    if address.constructor.toString() is @constructor.toString()
      @setProperties
        type: address.get 'type'
        postofficeBox: address.get 'postofficeBox'
        streetAddress: address.get 'streetAddress'
        extendedAddress: address.get 'extendedAddress'
        postalCode: address.get 'postalCode'
        city: address.get 'city'
        state: address.get 'state'
        country: address.get 'country'
        label: address.get 'label'
        geoPoint: address.get 'geoPoint'

`export default Address`
