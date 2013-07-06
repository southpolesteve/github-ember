Github.User = Ember.Model.extend
  url: Ember.attr()
  avatar_url: Ember.attr()
  login: Ember.attr()

Github.User.primaryKey = 'url'