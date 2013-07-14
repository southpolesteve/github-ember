Github.CommentsController = Ember.ArrayController.extend
  repo: null
  needs: ['repo', 'issue']
  repoBinding: 'controllers.repo'
  issueBinding: 'controllers.issue'
  newComment: Ember.Object.create()

  create: ()->
    comment = @get('issue.model').createComment(@get('newComment').getProperties('body'))
    comment.one 'didLoad', ()=>
      @addObject comment
      @resetNewComment()

    # TODO: Handle case when comment creation fails

  resetNewComment: ()->
    @set 'newComment', Ember.Object.create()