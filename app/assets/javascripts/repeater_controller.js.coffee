
root = global ? window

RepeaterIndexCtrl = ($scope, Fight, Field, $location, $routeParams) ->
  fields = Field.query() 
  field_id = 0 
  
  setInterval (->
    console.log(fields)
    $scope.field_fights = Fight.repeater id : field_id
    field_id = field_id + 1
    field_id = field_id % fields.length
  ), 5000

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
          
RepeaterIndexCtrl.$inject = ['$scope', 'Fight', 'Field']; 

# exports
root.RepeaterIndexCtrl  = RepeaterIndexCtrl
