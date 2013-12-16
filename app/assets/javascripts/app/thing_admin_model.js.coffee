class App.Models.ThingAdmin extends Backbone.Model
  urlRoot: "/things/a"
  idAttribute: "admin_url"

  initialize: ()->
    @errors = []

  validate: (attrs) ->
    @errors = []
    console.log "I got validated"
    console.log attrs.date

    unless moment(attrs.date).isValid()
      @errors.push I18n.t("errors.invalid-date")

    unless moment(attrs.time).isValid()
      @errors.push I18n.t("errors.invalid-time")

    # unless moment("#{attrs.date} #{attrs.time}").isAfter(moment())

