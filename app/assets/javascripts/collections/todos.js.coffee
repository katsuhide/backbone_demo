class BackboneDemo.Collections.Todos extends Backbone.Collection

  model: BackboneDemo.Models.Todo
  url: '/api/todos'

  done: ->
  	@where(done: true)

  remaining: ->
  	@without.apply(this, @done())