root = global ? window

angular.module("fights", ["ngResourceWithUrl"]).factory "Fight", ['$resourceUrl', ($resource) ->
  Fight = $resource("/fights/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"

    field_fights:
      method: "GET"
      url: "/field_fights:id"
      isArray: true

    field_fights_fights:
      method: "GET"
      url: "/field_fights/:field_actual_id"
      isArray: true

  )
  Fight::destroy = (cb) ->
    Fight.remove
      id: @id
    , cb

  Fight
]


root.angular = angular
