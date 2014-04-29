XSessionComponent = Ember.Component.extend

  getCurrentUser: (->
    unless @get('user.id')
      @get('user').getCurrentUser()
  ).on 'didInsertElement'

  actions:
    login: (properties) ->
      user = @get('user').login properties

    logout: ->
      @get('user').logout()

`export default XSessionComponent`
