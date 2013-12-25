Github.ReposRoute = Ember.Route.extend
  model: ()->
    Github.Repo.fetch({ url: 'https://api.github.com/user/repos' })

  setupController: (controller, model)->
    @_super(controller, model)
    @controllerFor('application').set('subTitle', 'Your Repos')