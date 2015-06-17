class TodoList.Models.Todo extends Backbone.Model
  paramRoot: 'todo'

  defaults:
    title: null
    completed: null
    order: null

class TodoList.Collections.TodosCollection extends Backbone.Collection
  model: TodoList.Models.Todo
  url: '/todos'
