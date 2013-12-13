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
      @thing.set "admin_url", ctx.params.key
      @thing.fetch().done =>
        console.log @thing
        @thingView = new App.Views.ThingAdmin
          app: @
          model: @thing
        .render()


    page "/p/:key", ->
      console.log "public page"

    page()
