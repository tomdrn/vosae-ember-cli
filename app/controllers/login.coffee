`import Ember from 'ember'`

LoginController = Ember.Controller.extend
  actions:
    authenticate: ->
      credentials = @getProperties('identification', 'password')
      sessionPromise = @get('session').authenticate('authenticator:vosae', credentials)
      sessionPromise.then null, (message) => @set('errorMessage', message)

`export default LoginController`
