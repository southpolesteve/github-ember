Github.Router.map ()->
  @route 'about'
  @resource 'repos', { path: '' }
  @resource 'repo', { path: '/:owner_name/:name' }, ()->
    @resource 'issue', { path: '/:number' }
    @route 'new'
