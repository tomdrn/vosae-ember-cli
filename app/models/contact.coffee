`import DS from 'ember-data'`
`import Entity from 'vosae/models/entity'`

###
 * A data model that represents a contact.
 * @class Contact
 * @extends Entity
###

Contact = Entity.extend
  name: DS.attr("string")
  firstname: DS.attr("string")
  additionalNames: DS.attr("string")
  civility: DS.attr("string", defaultValue: null)
  birthday: DS.attr("date")
  role: DS.attr("string")
  organization: DS.belongsTo("organization", async: true)

  fullName: (->
    firstname = @get('firstname')
    name = @get('name')
    if firstname and name
      return firstname + ' ' + name
    else if name and not firstname
      return name
    else if firstname and not name
      return firstname
    ''
  ).property('firstname', 'name')

  getErrors: ->
    errors = []
    unless @get('name')
      errors.addObject "Name field must not be blank"
    unless @get('firstname')
      errors.addObject "Firstname field must not be blank"
    return errors


`export default Contact`
