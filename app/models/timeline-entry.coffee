`import DS from 'ember-data'`

###
  A base model that represents a timeline entry.
  All timeline entry submodels are read only models.
  @class TimelineEntry
  @extends DS.Model
###

TimelineEntry = DS.Model.extend
  datetime: DS.attr('datetime')
  created: DS.attr('boolean')
  module: DS.attr('string')
  issuerName: DS.attr('string')
  issuer: DS.belongsTo('user')

  dateFormated: (->
    moment(@get('datetime')).format "LL"
  ).property('datetime')

`export default TimelineEntry`
