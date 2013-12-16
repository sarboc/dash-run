class App.Views.NewThing extends App.View
  template: JST["app/templates/new_thing_form"]
  el: "#container"

  initialize: ({@app, @model, @buttonText}) ->

  events:
    "submit form": "createThing"

  createThing: (event) ->
    event.preventDefault()
    @model.set
      admin_name: $("#admin-name").val()
      admin_email: $("#admin-email").val()
      venmo_id: $("#venmo-id").val()
      square_cash_email: $("#square-cash").val()
      title: $("#title").val()
      description: $("#description").val()
      min_contribution: $("#min-contribution").val()
      time: moment("#{$("#date").val()} #{$("#time").val()}")

    if @model.isValid()
      @model.save().done ->
        page("/a/#{ @model.get "admin_url" }")
    else
      $("#errors").addClass("alert alert-danger")
      $("#errors").empty()
      for error in @model.errors
        $("#errors").append "#{error} "




