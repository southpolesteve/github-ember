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

  actions:
    create: ()->
      # TODO: Handle case when comment creation fails
      promise = @get('issue.model').createComment(@get('newComment').getProperties('body'))
      promise.then (comment)=>
        @addObject comment
        @resetNewComment()

    close: ()->
      promise = @get('issue.model').close()


  resetNewComment: ()->
    @set 'newComment', Ember.Object.create()