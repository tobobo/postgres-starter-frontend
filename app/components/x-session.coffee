XSessionComponent = Ember.Component.extend
  didInsertElement: ->
    @send 'getCurrentUser'

  sessionReq: (method, data) ->
    params =
      method: method
      url: 'http://localhost:8888/sessions'
      xhrFields:
        withCredentials: true

    if data?
      params.data = data
    new Ember.RSVP.Promise (resolve, reject) =>
      setTimeout =>
        $.ajax params
        .then (data) =>
          resolve data
      , 1000

  setUserProperties: (properties) ->
    if @get('currentUser.model')?
      @get('currentUser').setProperties properties
    else
      @set 'currentUser.model', properties

  actions:
    getCurrentUser: ->
      @setUserProperties
        isLoading: true

      Ember.run =>
        @sessionReq 'get'
        .then (data) =>
          if data.sessions? and data.sessions[0]? and data.sessions[0].user?
            @currentUser.setUser data.sessions[0].user
          else
            @set 'currentUser.isLoading', false
        return

    login: ->
      @setUserProperties
        isSaving: true

      Ember.run =>
        @sessionReq 'post',
          session: @getProperties 'email', 'password'
        .then (data) =>
          if data.session? and data.session.user?
            @currentUser.setUser data.session.user

    logout: ->
      Ember.run =>
        @sessionReq 'delete'
        .then (data) =>
          window.location = '/'

`export default XSessionComponent`
