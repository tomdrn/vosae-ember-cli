`import DS from 'ember-data'`
`import vosaeSettings from 'vosae/conf/settings'`

###
  Transforms an array that contains all payment types objects
  See `vosaeSettings.paymentTypes`.
  @type PaymentTypesArrayTransform
  @extends DS.Transform
###

PaymentTypesArrayTransform = DS.Transform.extend
  ###
    Transforms an array of value

    ['CASH', 'CREDIT_CARD']
    into an array of objects with label and value

    [
      {label: 'Cash', value: 'CASH'},
      {label: 'Credit card', value: 'CREDIT_CARD'}
    ]
  ###
  deserialize: (deserialized)->
    if Em.isArray deserialized
      array = []
      deserialized.forEach (paymentTypeValue) ->
        paymentTypeObject = vosaeSettings.paymentTypes.findProperty('value', paymentTypeValue)
        array.pushObject(paymentTypeObject) if paymentTypeObject?
      return array
    return []

  ###
    Serialize an array of objects with label and value

    [
      {label: 'Cash', value: 'CASH'},
      {label: 'Credit card', value: 'CREDIT_CARD'}
    ]
    into an array of value
    ['CASH', 'CREDIT_CARD']
  ###
  serialize: (serialized)->
    if Em.isArray serialized
      array = []
      serialized.forEach (paymentType) ->
        value = paymentType.get('value')
        array.pushObject(value) if value?
      return array
    return []

`export default PaymentTypesArrayTransform`
