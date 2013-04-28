
root = global ? window

FieldFightsIndexCtrl = ($scope, Fight, $location, $routeParams) ->
  $scope.field_fights = Fight.field_fights() #query()

  $scope.save = (fight, competitor_winner_id) ->
    console.log(fight)
    fight.competitor_winner_id = competitor_winner_id
    Fight.update fight, (fight) ->
      $scope.field_fights = Fight.field_fights()
      #$location.path "/field_fights"


          
FieldFightsIndexCtrl.$inject = ['$scope', 'Fight']; 

# exports
root.FieldFightsIndexCtrl  = FieldFightsIndexCtrl
