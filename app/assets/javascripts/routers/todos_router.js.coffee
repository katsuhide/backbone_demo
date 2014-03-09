class BackboneDemo.Routers.Todos extends Backbone.Router
  routes:
  	'': 'index'

  initialize: ->
  	@collection = new BackboneDemo.Collections.Todos()
  	@collection.fetch(reset: true)

  index: ->
  	view = new BackboneDemo.Views.TodosIndex(collection: @collection)
