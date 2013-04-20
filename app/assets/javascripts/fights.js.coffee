root = global ? window

angular.module("fights", ["ngResource"]).factory "Fight", ['$resource', ($resource) ->
  Fight = $resource("/fights/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"

  )
  Fight::destroy = (cb) ->
    Fight.remove
      id: @id
    , cb

  Fight
]


root.angular = angular
