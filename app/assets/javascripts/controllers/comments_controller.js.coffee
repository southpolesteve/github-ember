Github.CommentsController = Ember.ArrayController.extend
  repo: null
  needs: ['repo']
  repoBinding: 'controllers.repo'