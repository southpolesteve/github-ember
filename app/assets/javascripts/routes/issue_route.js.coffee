Github.IssueRoute = Ember.Route.extend
  
  model: (params)->
    repo = @modelFor('repo')
    Github.Issue.fetch(repo.get('issues_url').split('{')[0] + "/" + params.number)

  serialize: (model)->
    { number: model.get('number') }