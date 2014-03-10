class BackboneDemo.Views.TodosItem extends Backbone.View

  template: JST['todos/item']

  tagName: 'li'

  events:
    'click .toggle': 'toggleDone'
    'dblclick .view': 'edit'
    'click a.destroy': 'clear'
    'keypress .edit': 'updateOnEnter'
    'blur .edit': 'close'

  initialize: ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'destroy', @remove)

  render: ->
    @$el.html(@template(item: @model))
    this

  toggleDone: ->
    @model.toggle()

  edit: ->
    @$el.addClass('editing')
    @$('edit').focus()
    console.log @$el

  close: ->
    value = @$('input.edit').val()
    unless value
      @clear()
    else
      @model.save(content: value)
      @$el.removeClass('editing')

  updateOnEnter: (e)->

    if e.keyCode is 13
      @close()

  clear: ->
    @model.destroy()
