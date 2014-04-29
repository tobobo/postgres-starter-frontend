XSessionComponent = Ember.Component.extend
  didInsertElement: ->
    @send 'getCurrentUser'
  actions:
    getCurrentUser: ->
      $.ajax 
        method: 'GET'
        url: 'http://localhost:8888/sessions'
        xhrFields:
          withCredentials: true
      .then (data) =>
        if data.sessions? and data.sessions[0]?
          @sendAction 'gotSession', data.sessions[0]
      return
    login: ->
      $.ajax
        method: 'POST'
        url: 'http://localhost:8888/sessions'
        data:
          session: @getProperties 'email', 'password'
        xhrFields:
          withCredentials: true
      .then (data) =>
        @sendAction 'loggedIn', data.session

`export default XSessionComponent`
