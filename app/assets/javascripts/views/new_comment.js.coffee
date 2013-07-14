Github.NewCommentView = Ember.View.extend
  templateName: 'new_comment'


  # TODO: RENABLE INFINITE SCROLL
  #  
  # didInsertElement: () ->
  #   @.$().bind 'inview', (event, isInView, visiblePartX, visiblePartY) =>
  #     if isInView && @get('controller.content.isLoaded')
  #       console.log('Appeared inview')
  #       @get('controller').loadMore()