class App.Views.ThingPublic extends App.View
  template: JST["app/templates/thing_public"]
  el: "#container"

  initialize: ({@model, @app}) ->
    @listenTo(@model, 'change', @render)

  events:
    "submit form": "addContributor"

  addContributor: (event) ->
    event.preventDefault()
    $.post "/contributors/#{ @model.get "public_url" }",
      name: $("#name").val()
      email: $("#email").val()
      contribution: $("#contribution").val()
      note: $("#note").val()
    .done =>
      (@model.get "contributors").push { name: $("#name").val() }
      @model.trigger "change"

