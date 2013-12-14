class App.Views.ThingPublic extends App.View
  template: JST["app/templates/thing_public"]
  el: "#container"

  initialize: ({@model, @app}) ->
    @listenTo(@model, 'change', @render)

  events:
    "submit form": "addContributor"

  addContributor: (event) ->
    event.preventDefault()
    name = $("#name").val()
    email = $("#email").val()
    contribution = parseInt $("#contribution").val()
    note = $("#note").val()
    $.post "/contributors/#{ @model.get "public_url" }",
      name: name
      email: email
      contribution: contribution
      note: note
    .done =>
      localStorage.last_contribution = contribution
      (@model.get "contributors").push { name: $("#name").val() }
      @model.set { total_contributions: (contribution + @model.get "total_contributions"), total_contributors: (1 + @model.get "total_contributors") }
      # @model.trigger "change"

