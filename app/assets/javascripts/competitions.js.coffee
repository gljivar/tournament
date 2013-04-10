root = global ? window

angular.module("competitions", ["ngResource"]).factory "Competition", ['$resource', ($resource) ->
  Competition = $resource("/competitions/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Competition::destroy = (cb) ->
    Competition.remove
      id: @id
    , cb

  Competition
]
root.angular = angular
