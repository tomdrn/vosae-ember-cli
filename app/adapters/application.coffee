`import DS from 'ember-data'`
`import config from 'vosae/config/environment'`

###
 * Main adapter for the application.
 *
 * @class ApplicationAdapter
 * @extends DS.RESTAdapter
###

ApplicationAdapter = DS.RESTAdapter.extend
  host: config.APP.endpoint
  namespace: config.APP.namespace
  headers: {
    "Authorization": "Basic dGhvbWFzQHZvc2FlLmNvbTpwYXNzd29yZA=="
    "Accept": "application/vnd.api+json"
    "X-Tenant": "naeka"
  }

`export default ApplicationAdapter`
