Github.IssueRoute = Ember.Route.extend
  
  model: (params)->
    repo = @modelFor('repo')
    Github.Issue.fetch(repo.get('issues_url').split('{')[0] + "/" + params.number)

  setupController: (controller, model)->
    @_super(controller, model)
    promise = model.fetchComments()
    promise.then (comments) ->
      controller.set('comments', comments)