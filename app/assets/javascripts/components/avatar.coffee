Github.GithubAvatarComponent = Ember.Component.extend
  tagName: 'img'
  classNames: ['draggable', 'thumbnail', 'avatar', 'pull-left', 'media-object']
  classNameBindings: ['isDragging']
  attributeBindings: ['draggable', 'src']
  draggable: 'true'
  src: Ember.computed.alias('user.avatar_url')
  
  dragStart: (event) ->
    @set('isDragging', true)
  
  dragEnd: () ->
    @set('isDragging', false)