Github.LoadMoreView = Ember.View.extend
  templateName: 'load_more'
   
  didInsertElement: () ->
    @.$().bind 'inview', (event, isInView, visiblePartX, visiblePartY) =>
      if isInView && @get('controller.content.isLoaded')
        @get('controller').loadMore()