
root = global ? window

CompetitionsIndexCtrl = ($scope, Competition) ->
  $scope.competitions = Competition.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @competition
      @competition.destroy ->
        $scope.competitions = _.without($scope.competitions, original)
        
CompetitionsIndexCtrl.$inject = ['$scope', 'Competition'];

CompetitionsCreateCtrl = ($scope, $location, Competition) ->
  $scope.save = ->
    Competition.save $scope.competition, (competition) ->
      $location.path "/competitions/#{competition.id}/edit"

CompetitionsCreateCtrl.$inject = ['$scope', '$location', 'Competition'];

CompetitionsShowCtrl = ($scope, $location, $routeParams, Competition) ->
  Competition.get
    id: $routeParams.id
  , (competition) ->
    @original = competition
    $scope.competition = new Competition(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.competition.destroy ->
        $location.path "/competitions"

CompetitionsShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Competition'];

CompetitionsEditCtrl = ($scope, $location, $routeParams, Competition) ->
  Competition.get
    id: $routeParams.id
  , (competition) ->
    @original = competition
    $scope.competition = new Competition(@original)

  $scope.isClean = ->
    console.log "[CompetitionsEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.competition

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.competition.destroy ->
        $location.path "/competitions"

  $scope.save = ->
    Competition.update $scope.competition, (competition) ->
      $location.path "/competitions"

CompetitionsEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Competition'];

# exports
root.CompetitionsIndexCtrl  = CompetitionsIndexCtrl
root.CompetitionsCreateCtrl = CompetitionsCreateCtrl
root.CompetitionsShowCtrl   = CompetitionsShowCtrl
root.CompetitionsEditCtrl   = CompetitionsEditCtrl 