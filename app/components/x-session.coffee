XSessionComponent = Ember.Component.extend

  getCurrentUser: (->
    unless @get('currentUser.id')
      @get('user').getCurrentUser()
  ).on 'didInsertElement'
  
  actions:
    login: (properties) ->
      @get('user').login properties

    logout: ->
      @get('user').logout()

`export default XSessionComponent`
