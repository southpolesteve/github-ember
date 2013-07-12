Github.Issue = Ember.Model.extend
  url: Ember.attr()
  title: Ember.attr()
  body: Ember.attr()
  state: Ember.attr()
  number: Ember.attr()
  created_at: Ember.attr()
  updated_at: Ember.attr()
  comments_url: Ember.attr()

  comments: (()->
    Github.Comment.find
      url: @get('comments_url')
      page: 1
  ).property('comments_url')

Github.Issue.primaryKey = 'url'

Github.Issue.reopenClass
  findByParams: (params)->
    url = "https://api.github.com/repos/" + params.owner_name + "/" + params.name
    Github.Issue.fetch(url)