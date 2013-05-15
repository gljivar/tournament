
root = global ? window

FightsIndexCtrl = ($scope, Fight, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal
  $scope.fights = Fight.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @fight
      @fight.destroy ->
        $scope.fights = _.without($scope.fights, original)

  $scope.isPossiblePrevious = (value) ->
    return (value.number < $scope.fight.number && value.category_id == $scope.fight.category_id )
  return; 
        
FightsIndexCtrl.$inject = ['$scope', 'Fight', 'TournamentGlobal'];

FightsCreateCtrl = ($scope, $location, Fight, TournamentGlobal) ->
  $scope.fight = new Fight()
  $scope.TournamentGlobal = TournamentGlobal

  $scope.save = ->
    Fight.save $scope.fight, (fight) ->
      $location.path "/fights/#{fight.id}/edit"

FightsCreateCtrl.$inject = ['$scope', '$location', 'Fight', 'TournamentGlobal'];

FightsShowCtrl = ($scope, $location, $routeParams, Fight, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal

  Fight.get
    id: $routeParams.id
  , (fight) ->
    @original = fight
    $scope.fight = new Fight(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.fight.destroy ->
        $location.path "/fights"

FightsShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Fight', 'TournamentGlobal'];

FightsEditCtrl = ($scope, $location, $routeParams, Fight) ->
  Fight.get
    id: $routeParams.id
  , (fight) ->
    @original = fight
    $scope.fight = new Fight(@original)

  $scope.isClean = ->
    #console.log "[FightsEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.fight

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.fight.destroy ->
        $location.path "/fights"

  $scope.save = ->
    Fight.update $scope.fight, (fight) ->
      #$location.path "/fights"
      $location.path "/fights/#{fight.id}/edit"


FightsEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Fight'];

# exports
root.FightsIndexCtrl  = FightsIndexCtrl
root.FightsCreateCtrl = FightsCreateCtrl
root.FightsShowCtrl   = FightsShowCtrl
root.FightsEditCtrl   = FightsEditCtrl 
