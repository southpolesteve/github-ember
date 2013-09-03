Github.ReposRoute = Ember.Route.extend
  model: ()->
    Github.Repo.fetch({ url: 'https://api.github.com/user/repos' })

  setupController: (controller, model)->
    controller.set('model', model);
    @controllerFor('application').set('subTitle', 'Your Repos')