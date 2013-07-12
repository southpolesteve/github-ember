Ember.Handlebars.helper 'markdown', (value, options) ->
  new Handlebars.SafeString("<div class='well'>#{marked(value)}</div>")