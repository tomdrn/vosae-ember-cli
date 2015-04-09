`import Base from 'simple-auth/authenticators/base'`

VosaeAuthenticator = Base.extend
  authenticate: (credentials) ->
    new Ember.RSVP.Promise (resolve, reject) ->
      if credentials.identification is "thomas" and credentials.password is "password"
        resolve()
      else
        reject("Login and / or password are invalid.")

`export default VosaeAuthenticator`
