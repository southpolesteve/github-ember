Github.Issue = Ember.Model.extend
  url: Ember.attr()
  title: Ember.attr()
  body: Ember.attr()
  state: Ember.attr()
  number: Ember.attr()
  created_at: Ember.attr()
  updated_at: Ember.attr()
  comments_url: Ember.attr()
  user: Ember.attr()

  closed: Ember.computed.equal('state', 'closed')

  updateUrl: Ember.computed.alias('url')

  fetchComments: ()->
    Github.Comment.fetch
      url: @get('comments_url')
      page: 1

  createComment: (attributes)->
    comment = Github.Comment.create(attributes)
    comment.set('createUrl', @get('comments_url'))
    comment.save()

Github.Issue.primaryKey = 'url'

Github.Issue.reopenClass
  findByParams: (params)->
    url = "https://api.github.com/repos/" + params.owner_name + "/" + params.name
    Github.Issue.fetch(url)