CurrentUserController = Ember.ObjectController.extend
  setUser: (user) ->
    unless (user.get? and user.get('store')?)
      user = @store.push 'user', user
    @set 'model', user


`export default CurrentUserController`
