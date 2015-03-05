`import DS from 'ember-data'`
`import vosaeSettings from 'vosae/conf/settings'`

###
 * A data model that represents an email.
 * @class Email
 * @extends DS.Model
###

Email = DS.Model.extend
  type: DS.attr("string", defaultValue: 'WORK')
  email: DS.attr('string')

  displayType: (->
    obj = vosaeSettings.emailTypeChoice.findProperty('value', @get('type'))
    return obj.get('name') if obj
    ''
  ).property('type')

  getErrors: ->
    errors = []
    unless @get('email')
      errors.addObject "Email field must not be blank"
    return errors

`export default Email`
