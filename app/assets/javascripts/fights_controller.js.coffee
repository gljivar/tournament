
root = global ? window

FightsIndexCtrl = ($scope, Fight) ->
  $scope.fights = Fight.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @fight
      @fight.destroy ->
        $scope.fights = _.without($scope.fights, original)

  $scope.isPreviousFight = (currentFight) ->
    return currentFight.number < 15 #$scope.fight.number

FightsIndexCtrl.$inject = ['$scope', 'Fight'];

FightsCreateCtrl = ($scope, $location, Fight) ->
  $scope.save = ->
    Fight.save $scope.fight, (fight) ->
      $location.path "/fights/#{fight.id}/edit"

FightsCreateCtrl.$inject = ['$scope', '$location', 'Fight'];

FightsShowCtrl = ($scope, $location, $routeParams, Fight) ->
  Fight.get
    id: $routeParams.id
  , (fight) ->
    @original = fight
    $scope.fight = new Fight(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.fight.destroy ->
        $location.path "/fights"

FightsShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Fight'];

FightsEditCtrl = ($scope, $location, $routeParams, Fight) ->
  Fight.get
    id: $routeParams.id
  , (fight) ->
    @original = fight
    $scope.fight = new Fight(@original)

  $scope.isClean = ->
    console.log "[FightsEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.fight

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.fight.destroy ->
        $location.path "/fights"

  $scope.save = ->
    Fight.update $scope.fight, (fight) ->
      $location.path "/fights"


FightsEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Fight'];

# exports
root.FightsIndexCtrl  = FightsIndexCtrl
root.FightsCreateCtrl = FightsCreateCtrl
root.FightsShowCtrl   = FightsShowCtrl
root.FightsEditCtrl   = FightsEditCtrl 
