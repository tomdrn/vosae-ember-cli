`import DS from 'ember-data'`
`import Entity from 'vosae-web-new/models/entity'`

###
 * A data model that represents an organization.
 * @class Organization
 * @extends Entity
###

Organization = Entity.extend
  corporateName: DS.attr('string')
  tags: DS.attr('string')
  contacts: DS.hasMany('contact', async: true)

  getErrors: ->
    errors = []
    unless @get('corporateName')
      errors.addObject "Corporate name field must not be blank"
    return errors

`export default Organization`
