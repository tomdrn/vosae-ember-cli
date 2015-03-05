`import Ember from 'ember'`

###
  The top level route. This route is entered when Vosae first boots up
  It will be in charge to fetch all dependencies we need such as
  `currencies` and `tenants` before the application is used by users.

  @class ApplicationRoute
  @extends Ember.Route
###

ApplicationRoute = Ember.Route.extend
  model: ->
    # Fetch tenants
    tenants = @store.find 'tenant'

`export default ApplicationRoute`
