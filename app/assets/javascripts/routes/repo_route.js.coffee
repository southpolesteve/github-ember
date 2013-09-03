Github.RepoRoute = Ember.Route.extend
  
  model: (params)->
    Github.Repo.fetchByParams(params)

  setupController: (controller, model)->
    @_super(controller, model)
    @controllerFor('application').set('subTitle', model.get('full_name'))
