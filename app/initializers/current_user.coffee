currentUserInitializer =
  name: 'injectCurrentUser'
  after: ['store', 'injectStore']
  initialize: (container, application) ->

    type = 'currentUser'
    container.typeInjection type, 'store', 'store:main'

    key = "#{type}:main"
    container.register key, Ember.ObjectController.extend
      setUserProperties: (properties) ->
        if @get('model')?
          @setProperties properties
        else
          @set 'model', properties

      setUser: (user) ->
        unless (user.get? and user.get('store')?)
          user = @store.push 'user', user
        @set 'model', user

      sessionReq: (method, data) ->
        params =
          method: method
          url: 'http://localhost:8888/sessions'
          xhrFields:
            withCredentials: true

        if data?
          params.data = data

        new Ember.RSVP.Promise (resolve, reject) =>
          Ember.$.ajax params
          .then (data) -> Ember.run -> resolve data
          , (error) -> Ember.run -> reject error

      getCurrentUser: ->
        @setUserProperties
          isLoading: true
        @sessionReq 'get'
        .then (data) =>
          if data.sessions? and data.sessions[0]? and data.sessions[0].user?
            @setUser data.sessions[0].user
            Ember.RSVP.resolve @
          else
            @set 'isLoading', false
            Ember.RSVP.reject()

      login: (properties) ->
        @sessionReq 'post',
          session: properties
        .then (data) =>
          if data.session? and data.session.user?
            @setUser data.session.user
            Ember.RSVP.resolve @
          else
            Ember.RSVP.reject()

      logout: ->
        @sessionReq 'delete'
        .then (data) =>
          window.location = '/'


    for type in ['controller', 'route']
      for name in ['currentUser']
        container.typeInjection type, name, key
        
`export default currentUserInitializer`
