window.App =
  Collections: {}
  Models: {}
  Views: {}

  start: ->
    page "/", ->
      console.log "homepage"

    page "/new", =>
      console.log "new"
      @newThing = new App.Views.NewThing
        app: @
      .render()

    page "/a/:key", ->
      console.log "admin page"

    page "/p/:key", ->
      console.log "public page"

    page()
