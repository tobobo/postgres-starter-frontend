ApplicationController = Ember.Controller.extend

  actions:
    loggedIn: (sessionData) ->
      user = @store.push 'user', sessionData.user
      @send 'setUser', user

    setUser: (user) ->
      @set 'currentUser.model', user

`export default ApplicationController`
