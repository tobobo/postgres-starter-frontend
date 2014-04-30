ApplicationController = Ember.Controller.extend
  queryParams: ['userStr:user']

  user: (->
    if @get('userStr')? then JSON.parse @get('userStr')
  ).property 'userStr'

  actions:
    loggedIn: (sessionData) ->

    gotSession: (sessionData) ->

`export default ApplicationController`
