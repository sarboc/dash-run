class App.Views.ThingPublic extends App.View
  template: JST["app/templates/thing_public"]
  el: "#container"

  initialize: ({@model, @app}) ->
    @errorChecks = 2
    @listenTo(@model, 'change', @render)

  events:
    "submit form": "checkData"

  addContributor: ->
    if _.isEmpty @errors
      $.post "/contributors/#{ @model.get "public_url" }", @formData
      .done =>
        localStorage.last_contribution = @formData.contribution
        (@model.get "contributors").push { name: $("#name").val() }
        @model.set { total_contributions: (@formData.contribution + @model.get "total_contributions"), total_contributors: (1 + @model.get "total_contributors") }
    else
      $("#errors").addClass("alert alert-danger")
      $("#errors").empty()
      for error in @errors
        $("#errors").append error

  checkData: (event) ->
    event.preventDefault()
    @formData =
      name: $("#name").val()
      email: $("#email").val()
      contribution: parseInt $("#contribution").val()
      note: $("#note").val()
    @errors = []
    @errorTally = 0

    @checkMinVal()
    @checkDeadline()

  checkDeadline: () ->
    if moment(@model.get "time").isBefore(moment())
      @errors.push I18n.t("errors.deadline")
    @tallyErrors()

  checkMinVal: () ->
    if @formData.contribution < (@model.get "min_contribution")
      @errors.push I18n.t("errors.min-contribution", currency: I18n.t("labels.currency"), amount: @model.get "min_contribution")
    @tallyErrors()
    # true

  tallyErrors: ->
    @errorTally += 1
    if @errorTally == @errorChecks
      @addContributor()



