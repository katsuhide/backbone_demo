window.BackboneDemo =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
  	# alert 'Hello from Backbone!'
  	new BackboneDemo.Routers.Todos()
  	Backbone.history.start()


$(document).ready ->
  BackboneDemo.initialize()
