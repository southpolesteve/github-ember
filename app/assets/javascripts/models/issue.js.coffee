Github.Issue = Ember.Model.extend
  url: Ember.attr()
  title: Ember.attr()
  body: Ember.attr()
  state: Ember.attr()
  number: Ember.attr()
  created_at: Ember.attr()
  updated_at: Ember.attr()
  comments_url: Ember.attr()
  comments: Ember.attr()

  getComments: (()->
    Github.Comment.find
      url: @get('comments_url')
      page: 1
  ).property('comments_url')

  createComment: (attributes)->
    comment = Github.Comment.create()
    comment.set('createUrl', @get('comments_url'))
    comment.setProperties(attributes)
    comment.save()
    comment


Github.Issue.primaryKey = 'url'

Github.Issue.reopenClass
  findByParams: (params)->
    url = "https://api.github.com/repos/" + params.owner_name + "/" + params.name
    Github.Issue.fetch(url)