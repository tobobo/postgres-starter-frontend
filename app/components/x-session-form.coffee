XSessionFormComponent = Ember.Component.extend
  login: 'login'
  actions:
    login: ->
      @sendAction 'login', @getProperties('email', 'password')

`export default XSessionFormComponent`
