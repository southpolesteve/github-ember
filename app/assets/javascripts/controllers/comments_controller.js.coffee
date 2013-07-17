Github.CommentsController = Ember.ArrayController.extend Github.PaginatedController,
  repo: null
  needs: ['repo', 'issue']
  repoBinding: 'controllers.repo'
  issueBinding: 'controllers.issue'
  newComment: Ember.Object.create()

  fetchPage: (page)->

    Github.Comment.fetch
      url: @get('issue.comments_url')
      page: page

  create: ()->
    comment = @get('issue.model').createComment(@get('newComment').getProperties('body'))
    comment.one 'didLoad', ()=>
      @addObject comment
      @resetNewComment()

    # TODO: Handle case when comment creation fails

  resetNewComment: ()->
    @set 'newComment', Ember.Object.create()