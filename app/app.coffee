`import Ember from 'ember'`
`import Resolver from 'ember/resolver'`
`import loadInitializers from 'ember/load-initializers'`
`import config from './config/environment'`
`import vosaeSettings from 'vosae-web-new/conf/settings'`
`import vosaeUtils from 'vosae-web-new/conf/utils'`


Ember.MODEL_FACTORY_INJECTIONS = false

App = Ember.Application.extend(
  modulePrefix: config.modulePrefix
  podModulePrefix: config.podModulePrefix
  Resolver: Resolver
)


loadInitializers App, config.modulePrefix

`export default App`
