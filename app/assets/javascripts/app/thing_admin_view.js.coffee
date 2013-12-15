class App.Views.ThingAdmin extends App.View
  template: JST["app/templates/thing"]
  el: "#container"

  initialize: ({@model, @app}) ->
    @listenTo(@model, "change", @render)

    setInterval () =>
      @model.fetch()
    , 60000

