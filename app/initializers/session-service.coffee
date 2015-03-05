SessionInitializer =
  name: 'session-service'
  initialize: (container, app) ->
    app.inject 'view', 'sessionService', 'service:session'
    app.inject 'route', 'sessionService', 'service:session'
    app.inject 'store', 'sessionService', 'service:session'
    app.inject 'model', 'sessionService', 'service:session'
    app.inject 'controller', 'sessionService', 'service:session'

`export default SessionInitializer`
