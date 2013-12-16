window.App =
  Collections: {}
  Models: {}
  Views: {}

  start: ->
    @thingModel
    page "/", ->
      @view = new App.Views.Homepage
      @view.render()

    page "/new", =>
      @thing = new App.Models.ThingAdmin
      @newThingView = new App.Views.NewThing
        app: @
        model: @thing
        buttonText: I18n.t("labels.submit")
      .render()

    page "/edit/:url", (ctx) =>
      @thing = new App.Models.ThingAdmin
      @thing.set "admin_url", ctx.params.url
      @thing.fetch().done =>
        @thingView = new App.Views.NewThing
          app: @
          model: @thing
          buttonText: I18n.t("labels.edit")
        .render()

    page "/a/:url", (ctx) =>
      @thing = new App.Models.ThingAdmin
      @thing.set "admin_url", ctx.params.url
      @thing.fetch().done =>
        @thingView = new App.Views.ThingAdmin
          app: @
          model: @thing
        .render()

    page "/p/:url", (ctx) =>
      @thing = new App.Models.ThingPublic
      @thing.set "public_url", ctx.params.url
      @thing.fetch().done =>
        console.log @thing
        @thingView = new App.Views.ThingPublic
          app: @
          model: @thing
        .render()

    page()
