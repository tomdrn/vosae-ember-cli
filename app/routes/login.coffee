`import Ember from 'ember'`
`import UnauthenticatedRouteMixin from 'simple-auth/mixins/unauthenticated-route-mixin'`

###
  The route in charge of the login page.

  @class ApplicationRoute
  @extends Ember.Route
  @mixins UnauthenticatedRouteMixin
###

LoginRoute = Ember.Route.extend UnauthenticatedRouteMixin,

  ###
   * Reset the controller error message each time the route is rendered.
   * @param  {Controller} controller instance
  ###
  setupController: (controller) ->
    controller.set('errorMessage', null)

`export default LoginRoute`
