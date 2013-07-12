Github.Comment = Ember.Model.extend
  body: Ember.attr()
  user: Ember.attr()

  # WHY DOES THIS FAIL?
  # user: Ember.belongsTo(Github.User, { key: 'url', embedded: true })

Github.Comment.primaryKey = 'url'