`import Ember from 'ember'`
`import ApplicationRouteMixin from 'simple-auth/mixins/application-route-mixin'`


###
  The top level route. This route is entered when Vosae first boots up
  It will be in charge to fetch all dependencies we need such as
  `currencies` and `tenants` before the application is used by users.

  @class ApplicationRoute
  @extends Ember.Route
  @mixins ApplicationRouteMixin
###

ApplicationRoute = Ember.Route.extend ApplicationRouteMixin,
  actions:
    invalidateSession: ->
      this.get('session').invalidate()

`export default ApplicationRoute`
