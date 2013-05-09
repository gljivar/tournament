
root = global ? window

StatusIndexCtrl = ($scope, Fight, TournamentGlobal) ->
  if root.io isnt `undefined`
    socket = root.io.connect("/",
      resource: "stream/socket.io"
    )

    fightCallback = ->
      $scope.field_fights = Fight.field_fights() #query()

    $scope.$on('$destroy', ->
      socket.removeListener("fight", fightCallback)
    )
    socket.on("fight", fightCallback)

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
          
StatusIndexCtrl.$inject = ['$scope', 'Fight', 'TournamentGlobal']; 

# exports
root.StatusIndexCtrl  = StatusIndexCtrl
