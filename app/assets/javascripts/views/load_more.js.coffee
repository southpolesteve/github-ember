Github.LoadMoreView = Ember.View.extend
  templateName: 'load_more'

  # TODO: RENABLE INFINITE SCROLL
  #  
  # didInsertElement: () ->
  #   @.$().bind 'inview', (event, isInView, visiblePartX, visiblePartY) =>
  #     if isInView && @get('controller.content.isLoaded')
  #       console.log('Appeared inview')
  #       @get('controller').loadMore()