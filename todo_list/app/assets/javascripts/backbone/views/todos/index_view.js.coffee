TodoList.Views.Todos ||= {}

class TodoList.Views.Todos.IndexView extends Backbone.View
  template: JST["backbone/templates/todos/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (todo) =>
    view = new TodoList.Views.Todos.TodoView({model : todo})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(todos: @collection.toJSON() ))
    @addAll()

    return this
