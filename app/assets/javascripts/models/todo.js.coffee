class BackboneDemo.Models.Todo extends Backbone.Model

  defaults: ->
  	content: "empty todo ..."
  	done: false

  toggle: ->
  	@save(done: !@get('done'))
