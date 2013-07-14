Github.RepoRoute = Ember.Route.extend
  
  model: (params)->
    Github.Repo.fetchByParams(params)

  setupController: (controller, model)->
    @_super(controller, model)
    @controllerFor('application').set('subTitle', model.get('full_name'))

  serialize: (model)->
    { owner_name: model.get('owner_name'), name: model.get('name') }