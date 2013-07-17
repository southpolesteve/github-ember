Github.PaginatedController = Ember.Mixin.create
  currentPage: 1
  lastPage: 9999
  isLoadingMore: false

  canLoadMore: (()->
    @get('lastPage') > @get('currentPage')
  ).property('lastPage', 'currentPage')

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
        # () =>
        #   @deincrementProperty('currentPage')
      )

  fetchPage: (page)->
    Ember.assert "Your controller did not define a fetchPage method. This is required when using the Pagination Controller mixin"