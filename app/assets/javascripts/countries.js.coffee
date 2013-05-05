root = global ? window

angular.module("countries", ["ngResource", 'analytics']).factory "Country", ['$resource', ($resource) ->
  Country = $resource("/countries/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Country::destroy = (cb) ->
    Country.remove
      id: @id
    , cb

  Country
]
root.angular = angular
