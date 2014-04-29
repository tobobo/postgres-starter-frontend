ApplicationController = Ember.Controller.extend

  createUserFromData: (data) ->
    if data.user? then @store.push 'user', data.user

  setUser: (user) ->
    @set 'currentUser.model', user

  actions:
    loggedIn: (sessionData) ->
      @setUser @createUserFromData(sessionData)

    gotSession: (sessionData) ->
      @setUser @createUserFromData(sessionData)

`export default ApplicationController`
