root = global ? window

angular.module("users", ["ngResource"]).factory "User", ['$resource', ($resource) ->
  User = $resource("/users/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  User::destroy = (cb) ->
    User.remove
      id: @id
    , cb

  User
]
root.angular = angular
