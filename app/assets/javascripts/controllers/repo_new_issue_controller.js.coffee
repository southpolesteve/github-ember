Github.RepoNewIssueController = Ember.ObjectController.extend
  repo: null
  needs: ['repo']
  repoBinding: 'controllers.repo'

  title: null
  body: null

  actions:
    create: ()->
      promise = @get('repo.model').createIssue(@getProperties('title', 'body'))
      promise.then (issue) =>
        @set('title', null)
        @set('body', null)
        @get('repo.model').addObject(issue)  
