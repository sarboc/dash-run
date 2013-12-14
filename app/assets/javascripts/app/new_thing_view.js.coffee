class App.Views.NewThing extends App.View
  template: JST["app/templates/new_thing_form"]
  el: "#container"

  initialize: ({@app}) ->

  events:
    "submit form": "createThing"

  createThing: (event) ->
    event.preventDefault()
    thingModel = new App.Models.ThingAdmin
    thingModel.save
      admin_name: $("#admin-name").val()
      admin_email: $("#admin-email").val()
      venmo_id: $("#venmo-id").val()
      square_cash_email: $("#square-cash").val()
      title: $("#title").val()
      description: $("#description").val()
      min_contribution: $("#min-contribution").val()
      date: $("#date").val()
      time: $("#time").val()
    .done ->
      page("/a/#{ thingModel.get "admin_url" }")
