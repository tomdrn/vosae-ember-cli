`import Ember from 'ember'`
`import config from 'vosae/config/environment'`

###
  All routes for the application
  @method Router
  @namespace Ember.Router
###

Router = Ember.Router.extend(location: config.locationType)
Router.map ->

`export default Router`
