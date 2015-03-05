`import DS from 'ember-data'`
`import config from 'vosae/config/environment'`

###
 * Main adapter for the application.
 *
 * @class ApplicationAdapter
 * @extends DS.RESTAdapter
###

ApplicationAdapter = DS.DjangoTastypieAdapter.extend
  host: config.APP.endpoint
  namespace: config.APP.namespace
  headers: {
    "Authorization": "ApiKey thomas@vosae.com:9f811dd44b3567333dce068a74b9ac9e3e231d19"
    "X-Tenant": "naeka"
  }

`export default ApplicationAdapter`
