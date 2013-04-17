root = global ? window

angular.module("categories", ["ngResource"]).factory "Category", ['$resource', ($resource) ->
  Category = $resource("/categories/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Category::destroy = (cb) ->
    Category.remove
      id: @id
    , cb

  Category
]
root.angular = angular
