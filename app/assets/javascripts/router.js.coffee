Github.Router.map ()->
  @resource 'repos', { path: '' }
  @resource 'repo', { path: '/:owner_name/:name' }, ()->
    @resource 'issue', { path: '/:number' }
