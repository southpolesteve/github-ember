Github.RepoNewController = Ember.ObjectController.extend
  repo: null
  needs: ['repo']
  repoBinding: 'controllers.repo'
  newIssue: Ember.Object.create()
  
  create: ()->
    issue = @get('repo.model').createIssue({body: "body1", title:"title1"})
    #@get('newIssue').getProperties('body'),@get('newIssue').getProperties('title')
    # comment.one 'didLoad', ()=>
    #   @addObject comment
    #   @resetNewComment()
