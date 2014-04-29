ApplicationRoute = Ember.Route.extend
  beforeModel: ->
    @set 'currentUser.store', @get('store')

`export default ApplicationRoute`
