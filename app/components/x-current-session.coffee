XCurrentSessionComponent = Ember.Component.extend
  logout: 'logout'
  actions:
    logout: ->
      @sendAction 'logout'

`export default XCurrentSessionComponent`
