Github.Repo = Ember.Model.extend
  name: Ember.attr()
  full_name: Ember.attr()
  open_issues: Ember.attr()
  url: Ember.attr()
  issues_url: Ember.attr()
  collaborators_url: Ember.attr()

  issues: (()->
    Github.Issue.find
      url: @get('issues_url').split('{')[0]
      page: 1
  ).property('issues_url')

  collaborators: (()->
    Github.User.find
      url: @get('collaborators_url').split('{')[0]
      page: 1
  ).property('collaborators_url')

  owner_name: (()->
    @get('full_name').split('/')[0]
  ).property('full_name')

  createIssue: (attributes)->
    issue = Github.Issue.create()
    issue.setProperties(attributes)
    issue.save()
    issue

Github.Repo.primaryKey = "url"
Github.Repo.collectionUrl = "/user/repos"

Github.Repo.reopenClass
  fetchByParams: (params)->
    url = "https://api.github.com/repos/" + params.owner_name + "/" + params.name
    Github.Repo.fetch(url)


