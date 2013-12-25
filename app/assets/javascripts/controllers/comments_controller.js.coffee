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
      issue = @get('issue.model')
      repo = @get('repo.model')
      issue.set('state', 'closed')
      issue.save().then (issue) =>
        @transitionTo('repo', repo)


  resetNewComment: ()->
    @set 'newComment', Ember.Object.create()