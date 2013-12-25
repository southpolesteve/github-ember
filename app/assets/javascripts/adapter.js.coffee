# Ember.Adapter = Ember.Object.extend({
#   find: function(record, id) {}, // find a single record
#   findAll: function(klass, records) {}, // find all records
#   findQuery: function(klass, records, params) {}, // find records using a query
#   createRecord: function(record) {}, // create a new record on the server
#   saveRecord: function(record) {}, // save an existing record on the server
#   deleteRecord: function(record) {} // delete a record on the server
# });


get = Ember.get

Github.Adapter = Ember.Adapter.extend
  base: "https://api.github.com"

  find: (record, id) ->
    @ajax(id).then (response) ->
      record.load id, response.data
      record

  findAll: (klass, records) ->
    @ajax(@base + klass.collectionUrl).then (response) ->
      records.load klass, response.data
      records

  findQuery: (klass, records, params) ->
    url = params.url
    delete params.url
    @ajax(url, params).then (response) =>
      links = response.headers.getResponseHeader('link')
      if links
        pages = @_parseLinkHeader(links)
        records.set('lastPage', pages.last_page)
      else
        records.set('lastPage', 1)
      records.load klass, response.data
      records

  ajax: (url, params, method) ->
    @_ajax url, params, method || "GET"

  createRecord: (record)->
    @ajax(record.createUrl, record.toJSON(), "POST").then (response) ->
      primaryKey = get(record.constructor, 'primaryKey')
      record.load(response.data[primaryKey], response.data)
      record.didCreateRecord()
      record

  saveRecord: (record)->
    @ajax(record.updateUrl, record.toJSON(), "PATCH").then (response) ->
      record.didSaveRecord()
      record

  buildURL: (klass, params) ->
    @base + klass.url

  #https://gist.github.com/niallo/3109252
  _parseLinkHeader: (header) ->
    parts = header.split(",")
    pages = {}
    for part in parts
      section = part.split(";")
      url = section[0].replace(/<(.*)>/, "$1").trim()
      name = section[1].replace(/rel="(.*)"/, "$1").trim()
      pages[name+"_page"] = parseInt(url.split("page=")[1])
    pages

  _ajax: (url, params, method) ->
    settings =
      url: url
      type: method
      dataType: "json"
      beforeSend: (request) ->
        request.setRequestHeader("Authorization", "token #{token}");

        #TODO: Eventually use this to get full github processed HTML for issues and comments?
        #request.setRequestHeader("Accept", "application/vnd.github.v3.full+json")

    new Ember.RSVP.Promise (resolve, reject) =>
      if params
        if method is "GET"
          settings.data = params
        else
          settings.contentType = "application/json; charset=utf-8"
          settings.data = JSON.stringify(params)
      settings.success = (json, textStatus, jqXHR) =>
        response = {}
        response.data = json
        response.headers = jqXHR
        Ember.run null, resolve, response

      settings.error = (jqXHR, textStatus, errorThrown) =>
        Ember.run null, reject, jqXHR

      Ember.$.ajax settings

modelClasses = [Github.User, Github.Repo, Github.Issue, Github.Comment]
modelClasses.forEach (klass) ->
  klass.adapter = Github.Adapter.create()