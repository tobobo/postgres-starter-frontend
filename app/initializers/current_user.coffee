`import CurrentUserController from 'postgres-starter-frontend/controllers/current_user'`

currentUserInitializer =
  name: 'injectCurrentUser'
  after: ['store', 'injectStore']
  initialize: (container, application) ->

    type = 'currentUser'
    key = "#{type}:main"

    container.register key, CurrentUserController
    container.typeInjection type, 'store', 'store:main'

    for type in ['controller', 'route', 'component']
      for name in ['currentUser']
        container.typeInjection type, name, key
        
`export default currentUserInitializer`
