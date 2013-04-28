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
      url: "/field_fights/:id"
      params:
        param1: "test"
        #id: 23
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
