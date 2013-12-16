class App.Models.ThingAdmin extends Backbone.Model
  urlRoot: "/things/a"
  idAttribute: "admin_url"

  initialize: ()->
    @errors = []

  validate: (attrs) ->
    @errors = []
    console.log "I got validated"
    console.log attrs.date

    unless moment(attrs.datetime).isValid()
      @errors.push I18n.t("errors.invalid-datetime")

    unless moment(attrs.datetime).isAfter(moment())
      @errors.push I18n.t("errors.past")

