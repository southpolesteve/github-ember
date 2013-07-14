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
    @ajax(id).then (data) ->
      record.load id, data

  findAll: (klass, records) ->
    @ajax(@base + klass.collectionUrl).then (data) ->
      records.load klass, data

  findQuery: (klass, records, params) ->
    url = params.url
    delete params.url
    @ajax(url, params).then (data) =>
        records.load klass, data

  ajax: (url, params, method) ->
    @_ajax url, params, method || "GET"

  createRecord: (record)->
    @ajax(record.createUrl, record.toJSON(), "POST").then (data) ->
      primaryKey = get(record.constructor, 'primaryKey')
      record.load(data[primaryKey], data)
      record.didCreateRecord()

  buildURL: (klass, params) ->
    @base + klass.url

  _ajax: (url, params, method) ->
    settings =
      url: url
      type: method
      dataType: "json"
      beforeSend: (request) ->
        request.setRequestHeader("Authorization", "token #{token}");

        #TODO: Eventually use this to get full github processed HTML for issues and comments?
        #request.setRequestHeader("Accept", "application/vnd.github.v3.full+json")

    new Ember.RSVP.Promise((resolve, reject) ->
      if params
        if method is "GET"
          settings.data = params
        else
          settings.contentType = "application/json; charset=utf-8"
          settings.data = JSON.stringify(params)
      settings.success = (json, textStatus, jqXHR) ->
        Ember.run null, resolve, json
        console.log jqXHR.getResponseHeader('Link')

      settings.error = (jqXHR, textStatus, errorThrown) ->
        Ember.run null, reject, jqXHR

      Ember.$.ajax settings
    )

modelClasses = [Github.User, Github.Repo, Github.Issue, Github.Comment]
modelClasses.forEach (klass) ->
  klass.adapter = Github.Adapter.create()
