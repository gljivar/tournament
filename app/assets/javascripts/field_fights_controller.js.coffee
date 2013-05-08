
root = global ? window

FieldFightsIndexCtrl = ($scope, Fight, $location, $routeParams, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal
  $scope.field_fights = Fight.field_fights() #query()

  $scope.save = (fight, competitor_winner_id) ->
    fight.competitor_winner_id = competitor_winner_id
    Fight.update fight, (fight) ->
      $scope.field_fights = Fight.field_fights()

  $scope.isCurrentFight = (fight, fights) ->
    current_fight = null 
    for f in fights then do (f) =>
      current_fight = f if f.competitor_winner_id == null and current_fight == null
    current_fight = fight if current_fight == null
    return current_fight == fight

  $scope.fieldOrder = (fight) ->
    return fight.name
          
FieldFightsIndexCtrl.$inject = ['$scope', 'Fight', 'TournamentGlobal']; 

# exports
root.FieldFightsIndexCtrl  = FieldFightsIndexCtrl
