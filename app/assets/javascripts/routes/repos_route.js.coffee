Github.ReposRoute = Ember.Route.extend
  model: ()->
    Github.Repo.fetch()