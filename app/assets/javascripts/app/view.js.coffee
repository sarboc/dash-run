class App.View extends Backbone.View
  render: ->
    # Return ourself for chaining
    _.tap @, =>
      @$el.html @template @