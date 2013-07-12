Github.RepoRoute = Ember.Route.extend
  
  model: (params)->
    Github.Repo.fetchByParams(params)

  serialize: (model)->
    { owner_name: model.get('owner_name'), name: model.get('name') }