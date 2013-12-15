class App.Views.ThingAdmin extends App.View
  template: JST["app/templates/thing"]
  el: "#container"

  initialize: ({@model, @app}) ->
    setInterval () =>
      console.log "rendering"
      @render()
    , 60000
