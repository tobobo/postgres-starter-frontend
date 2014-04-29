`import CurrentUserController from 'postgres-starter-frontend/controllers/current_user'`

currentUserInitializer =
  name: 'injectCurrentUser'
  after: ['store', 'injectStore']
  initialize: (container, application) ->

    type = 'currentUser'
    container.typeInjection type, 'store', 'store:main'

    key = "#{type}:main"
    container.register key, CurrentUserController

    for type in ['controller', 'route', 'component']
      for name in ['currentUser']
        container.typeInjection type, name, key
        
`export default currentUserInitializer`
