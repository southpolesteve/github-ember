Github.PaginatedController = Ember.Mixin.create
  currentPage: 1
  isLoadingMore: false

  canLoadMore: (()->
    if @get('content.isLoaded')
      @get('content.lastPage') > @get('currentPage')
    else
      true
  ).property('content.lastPage', 'currentPage', 'isLoaded')

  loadMore: () ->
    if @get('canLoadMore')
      @set('isLoadingMore', true)
      page = @incrementProperty('currentPage')
      new_issues = @fetchPage(page)
      new_issues.then(
        (data) =>
          @addObjects(data)
          @set('lastPage', data.get('last_page'))
          @set('isLoadingMore', false)
      )

  fetchPage: (page)->
    Ember.assert "Your controller did not define a fetchPage method. This is required when using the Pagination Controller mixin"