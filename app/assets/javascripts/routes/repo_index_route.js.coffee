Github.RepoIndexRoute = Ember.Route.extend
  
  model: ()->
    @modelFor('repo').get('issues')