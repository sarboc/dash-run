window.App =
  Collections: {}
  Models: {}
  Views: {}

  start: ->
    console.log "This thing works"
    page '/', ->
      console.log "homepage"

    page '/a/:user', ->
      console.log "admin page"

    page()
