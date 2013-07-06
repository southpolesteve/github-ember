Github.Repo = Ember.Model.extend
  name: Ember.attr()
  full_name: Ember.attr()
  open_issues: Ember.attr()
  url: Ember.attr()
  issues_url: Ember.attr()

  issues: (()->
    Github.Issue.find
      url: @get('issues_url').split('{')[0]
  ).property('issues_url')

  owner_name: (()->
    @get('full_name').split('/')[0]
  ).property('full_name')


Github.Repo.primaryKey = "url"
Github.Repo.collectionUrl = "/user/repos"

Github.Repo.reopenClass
  findByParams: (params)->
    url = "https://api.github.com/repos/" + params.owner_name + "/" + params.name
    Github.Repo.find(url)