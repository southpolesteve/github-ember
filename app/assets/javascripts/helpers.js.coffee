Ember.Handlebars.helper 'markdown', (value, options) ->
  new Handlebars.SafeString(marked(value))