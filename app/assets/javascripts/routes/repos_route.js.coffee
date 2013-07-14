Github.ReposRoute = Ember.Route.extend
  model: ()->
    Github.Repo.fetch()

  setupController: (controller, model)->
    @_super(controller, model)
    @controllerFor('application').set('subTitle', 'Your Repos')