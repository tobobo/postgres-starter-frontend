XSessionComponent = Ember.Component.extend
  didInsertElement: ->
    @send 'getCurrentUser'
  actions:
    getCurrentUser: ->
      $.ajax 
        method: 'GET'
        url: 'http://localhost:8888/sessions'
      .then (data) =>
        console.log 'data', data
      return
    login: ->
      $.ajax
        method: 'POST'
        url: 'http://localhost:8888/sessions'
        data:
          session: @getProperties 'email', 'password'
      .then (data) =>
        @sendAction 'loggedIn', data.session

`export default XSessionComponent`
