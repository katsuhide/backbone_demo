class BackboneDemo.Views.TodosIndex extends Backbone.View

  template: JST['todos/stats']

  el: '#todoapp'

  events:
    'keypress #new-todo': 'createOnEnter'
    'click #clear-completed': 'clearCompleted'
    'click #toggle-all': 'toggleAllComplete'

  initialize: ->
    @listenTo(@collection, 'add', @addOne)
    @listenTo(@collection, 'reset', @addAll)
    @listenTo(@collection, 'all', @render)

  render: ->
    if @collection.length
      @$('#main').show()
      @$('footer').html(@template(todos: @collection)).show()
    else
      @$('#main').hide()
      @$('footer').hide()

    this

  addOne: (todo)->
    view = new BackboneDemo.Views.TodosItem(model: todo)
    @$('#todo-list').append(view.render().el)

  addAll: ->
    @collection.each(@addOne, this)

  createOnEnter: (e)->
    text = @$('#new-todo').val()

    if text and e.keyCode is 13
      @collection.create(content: text)
      @$('#new-todo').val("")

  clearCompleted: ->
    _.invoke(@collection.done(), 'destroy')
    false

  toggleAllComplete: ->
    done = @$('#toggle-all').prop('checked')

    @collection.each (todo)->
      todo.save('done': done)
