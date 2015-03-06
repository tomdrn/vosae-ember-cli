`import DS from 'ember-data'`

###
  Adds support of type datetime to `DS.Model` attr.
  @type datetime
  @extends DS.Transform
###

DatetimeTransform = DS.Transform.extend
  deserialize: (serialized) ->
    type = typeof serialized
    if type is "string" or type is "number"
      moment(serialized).toDate()
    else if serialized is null or serialized is `undefined`
      serialized
    else
      null

  serialize: (deserialized) ->
    if deserialized instanceof Date or moment.isMoment(deserialized)
      moment(deserialized).format()
    else if date is `undefined`
      `undefined`
    else
      null

`export default DatetimeTransform`
