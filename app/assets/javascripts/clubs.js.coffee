root = global ? window

angular.module("clubs", ["ngResource"]).factory "Club", ['$resource', ($resource) ->
  Club = $resource("/clubs/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Club::destroy = (cb) ->
    Club.remove
      id: @id
    , cb

  Club
]
root.angular = angular
