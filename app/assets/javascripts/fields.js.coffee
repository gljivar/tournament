root = global ? window

angular.module("fields", ["ngResource"]).factory "Field", ['$resource', ($resource) ->
  Field = $resource("/fields/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Field::destroy = (cb) ->
    Field.remove
      id: @id
    , cb

  Field
]
root.angular = angular
