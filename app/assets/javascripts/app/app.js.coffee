window.App =
  Collections: {}
  Models: {}
  Views: {}

  start: ->
    console.log "App starting..."
    page '/', ->
      console.log "homepage"

    page '/new', ->
      @newThing = new App.Views.NewThing
        app: @
      .render()

    page '/a/:user', ->
      console.log "admin page"

    page()
