Github.IssuesController = Ember.ArrayController.extend Github.PaginatedController,
  repo: null
  needs: ['repo']
  repoBinding: 'controllers.repo'  

  fetchPage: (page)->
    Github.Issue.fetch
      url: @get('repo.issues_url').split('{')[0] 
      page: page

