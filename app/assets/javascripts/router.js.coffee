Github.Router.map ()->
  @route 'about'
  @resource 'repos', { path: '' }
  @resource 'watched', { path: 'repos/watched' }
  @resource 'repo', { path: '/:owner_name/:name' }, ()->
    @resource 'issue', { path: '/:number' }
    @route 'new_issue'
