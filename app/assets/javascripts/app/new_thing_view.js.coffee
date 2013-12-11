class App.Views.NewThing extends App.View
  template: JST["app/templates/new_thing_form"]
  el: "#container"

  initialize: ({@app}) ->
    console.log "I got created!"