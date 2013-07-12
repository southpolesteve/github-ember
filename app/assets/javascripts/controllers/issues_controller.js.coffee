Github.IssuesController = Ember.ArrayController.extend
  repo: null
  needs: ['repo']
  repoBinding: 'controllers.repo'  
  currentPage: 1
  allLoaded: false
  isLoadingMore: false

  loadMore: () ->
    @set('isLoadingMore', true)
    page = @incrementProperty('currentPage')
    new_issues = Github.Issue.fetch
      url: @repo.get('issues_url').split('{')[0] 
      page: page
    new_issues.then(
      (data) =>
        @addObjects(data)
        @set('isLoadingMore', false)
      # () =>
      #   @deincrementProperty('currentPage')
    )