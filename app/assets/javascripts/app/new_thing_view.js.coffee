class App.Views.NewThing extends App.View
  template: JST["app/templates/new_thing_form"]
  el: "#container"

  initialize: ({@app, @model, @buttonText}) ->
    @listenTo @model, "invalid", @printErrors
    @listenTo @model, "sync", ->
      page("/a/#{ @model.get "admin_url" }")

  events:
    "submit form": "createThing"

  createThing: (event) ->
    event.preventDefault()
    @model.save
      admin_name: $("#admin-name").val()
      admin_email: $("#admin-email").val()
      venmo_id: $("#venmo-id").val()
      square_cash_email: $("#square-cash").val()
      title: $("#title").val()
      description: $("#description").val()
      min_contribution: $("#min-contribution").val()
      time: moment("#{$("#date").val()} #{$("#time").val()}")

  printErrors: (model, errors) ->
    $("#errors").addClass("alert alert-danger")
    $("#errors").empty()
    for error in errors
      $("#errors").append "#{error} "



