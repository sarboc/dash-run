window.App =
  Collections: {}
  Models: {}
  Views: {}

  start: ->
    @thingModel
    page "/", ->
      console.log "homepage"

    page "/new", =>
      console.log "new"
      @newThingView = new App.Views.NewThing
        app: @
      .render()

    page "/a/:key", (ctx) =>
      console.log "admin page"
      @thing = new App.Models.Thing
      console.log ctx.params.key

    page "/p/:key", ->
      console.log "public page"

    page()
