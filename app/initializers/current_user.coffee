`import CurrentUserController from 'postgres-starter-frontend/controllers/current_user'`

currentUserInitializer =
  name: 'injectCommon'
  initialize: (container, application) ->

    key = 'currentUser:main'

    container.register key, CurrentUserController

    for type in ['controller', 'route']
      for name in ['currentUser']
        container.typeInjection type, name, key
        
`export default currentUserInitializer`
