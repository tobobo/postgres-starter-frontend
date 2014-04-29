currentUserInitializer =
  name: 'injectCurrentUser'
  after: ['store', 'injectStore']
  initialize: (container, application) ->

    type = 'currentUser'
    container.typeInjection type, 'store', 'store:main'

    key = "#{type}:main"
    container.register key, Ember.ObjectController.extend
      setUser: (user) ->
        unless (user.get? and user.get('store')?)
          user = @store.push 'user', user
        @set 'model', user

    for type in ['controller', 'route', 'component']
      for name in ['currentUser']
        container.typeInjection type, name, key
        
`export default currentUserInitializer`
