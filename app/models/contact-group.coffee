`import DS from 'ember-data'`

###
 * A data model that represents a group of contact.
 * @class ContactGroup
 * @extends DS.Model
###

ContactGroup = DS.Model.extend
  name: DS.attr('string')

`export default ContactGroup`
