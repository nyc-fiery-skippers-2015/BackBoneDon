class TodoList.Routers.TodosRouter extends Backbone.Router
  initialize: (options) ->
    @todos = new TodoList.Collections.TodosCollection()
    @todos.reset options.todos

  routes:
    "new"      : "newTodo"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newTodo: ->
    @view = new TodoList.Views.Todos.NewView(collection: @todos)
    $("#todos").html(@view.render().el)

  index: ->
    @view = new TodoList.Views.Todos.IndexView(collection: @todos)
    $("#todos").html(@view.render().el)

  show: (id) ->
    todo = @todos.get(id)

    @view = new TodoList.Views.Todos.ShowView(model: todo)
    $("#todos").html(@view.render().el)

  edit: (id) ->
    todo = @todos.get(id)

    @view = new TodoList.Views.Todos.EditView(model: todo)
    $("#todos").html(@view.render().el)
