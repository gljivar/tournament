root = global ? window

angular.module("competitors", ["ngResource"]).factory "Competitor", ['$resource', ($resource) ->
  Competitor = $resource("/competitors/:id",
    id: "@id"
  ,
    update:
      method: "PUT"

    destroy:
      method: "DELETE"
  )
  Competitor::destroy = (cb) ->
    Competitor.remove
      id: @id
    , cb

  Competitor
]
root.angular = angular
