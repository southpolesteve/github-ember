Github.WatchedRoute = Ember.Route.extend
  model: ()->
    Github.Repo.fetch({ url: 'https://api.github.com/user/subscriptions' })

  setupController: (controller, model)->
    @_super(controller, model)
    @controllerFor('application').set('subTitle', 'Watched Repos')