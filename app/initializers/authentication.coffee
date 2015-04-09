`import VosaeAuthenticator from 'vosae/authenticators/vosae'`

initialize = (container, app) ->
  container.register('authenticator:vosae', VosaeAuthenticator)

AuthenticationInitializer =
  name: 'authentication'
  initialize: initialize

`export {initialize}`
`export default AuthenticationInitializer`
