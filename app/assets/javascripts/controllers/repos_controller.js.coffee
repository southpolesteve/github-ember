Github.ReposController = Ember.ArrayController.extend Github.PaginatedController,

  fetchPage: (page)->
    Github.Repo.fetch
      url: "https://api.github.com" + Github.Repo.collectionUrl 
      page: page