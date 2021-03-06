Github.ReposController = Ember.ArrayController.extend Github.PaginatedController,

  hideZeroIssues: true

  filteredContent: ( ->
    if @get('hideZeroIssues')
      @content.filterBy('hasOpenIssues')
    else
      @content
  ).property('content.@each.hasOpenIssues', 'hideZeroIssues')

  fetchPage: (page)->
    Github.Repo.fetch
      url: 'https://api.github.com/user/repos'
      page: page