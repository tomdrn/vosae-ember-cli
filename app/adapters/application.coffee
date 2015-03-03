`import DS from 'ember-data'`
`import config from '../config/environment'`

###
  Main adapter for the application.

  @class ApplicationAdapter
  @extends DS.RESTAdapter
###

ApplicationAdapter = DS.DjangoTastypieAdapter.extend
  host: config.APP.endpoint
  namespace: config.APP.namespace
  headers: {
    "Authorization": "ApiKey thomas@vosae.com:9f811dd44b3567333dce068a74b9ac9e3e231d19"
    "X-Tenant": "naeka"
  }

  # ###
  #  * Add backslash to the end of the URL.
  #  * @param  {String}   type
  #  * @param  {String}   id
  #  * @param  {DS.Model} record
  #  * @return {String}
  # ###
  # buildURL: (type, id, record) ->
  #   @_super(type, id) + "/"


  # ###
  #  * Do not pluralize the type's name
  #  * @param  {String} type
  #  * @return {String} type
  # ###
  # pathForType: (type) ->
  #   type

`export default ApplicationAdapter`
