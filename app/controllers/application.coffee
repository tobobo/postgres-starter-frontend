ApplicationController = Ember.Controller.extend
  queryParams: ['userStr:user']

  user: ((prop, value) ->
    if value? then value
    else if @get('userStr')? then JSON.parse @get('userStr')
  ).property 'userStr'
  
  removeUserFromUrl: (->
    if (user = @get('user'))?

      Ember.run.scheduleOnce 'sync', =>
        @replaceRoute @get('currentRoute')
        @set 'user', user
  ).observes('user').on('init')

  actions:

    loggedIn: (sessionData) ->

    gotSession: (sessionData) ->

`export default ApplicationController`
