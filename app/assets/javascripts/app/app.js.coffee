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
      @thing = new App.Models.ThingAdmin
      @newThingView = new App.Views.NewThing
        app: @
        model: @thing
        buttonText: I18n.t("labels.submit")
      .render()

    page "/edit/:url", (ctx) =>
      console.log "edit"
      @thing = new App.Models.ThingAdmin
      @thing.set "admin_url", ctx.params.url
      @thing.fetch().done =>
        @thingView = new App.Views.NewThing
          app: @
          model: @thing
          buttonText: I18n.t("labels.edit")
        .render()

    page "/a/:url", (ctx) =>
      console.log "admin page"
      @thing = new App.Models.ThingAdmin
      @thing.set "admin_url", ctx.params.url
      @thing.fetch().done =>
        @thingView = new App.Views.ThingAdmin
          app: @
          model: @thing
        .render()

    page "/p/:url", (ctx) =>
      console.log "public page"
      @thing = new App.Models.ThingPublic
      @thing.set "public_url", ctx.params.url
      @thing.fetch().done =>
        console.log @thing
        @thingView = new App.Views.ThingPublic
          app: @
          model: @thing
        .render()

    page()
