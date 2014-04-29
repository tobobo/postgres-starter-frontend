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

    Ember.$.ajax params

  setUserProperties: (properties) ->
    if @get('currentUser.model')?
      @get('currentUser').setProperties properties
    else
      @set 'currentUser.model', properties

  actions:
    getCurrentUser: ->
      @setUserProperties
        isLoading: true

      @sessionReq 'get'
      .then (data) =>
        if data.sessions? and data.sessions[0]? and data.sessions[0].user?
          @currentUser.setUser data.sessions[0].user
        else
          @set 'currentUser.isLoading', false
      return

    login: (properties) ->
      @setUserProperties
        isSaving: true
      @sessionReq 'post',
        session: properties
      .then (data) =>
        if data.session? and data.session.user?
          @currentUser.setUser data.session.user

    logout: ->
      @sessionReq 'delete'
      .then (data) =>
        window.location = '/'

`export default XSessionComponent`
