
root = global ? window

CompetitorsIndexCtrl = ($scope, Competitor, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal
  $scope.competitors = Competitor.query()

  $scope.isPossibleWinner = (value) ->
    return ( value.id == $scope.fight.competitor_blue_id || value.id == $scope.fight.competitor_red_id)

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @competitor
      @competitor.destroy ->
        $scope.competitors = _.without($scope.competitors, original)
        
CompetitorsIndexCtrl.$inject = ['$scope', 'Competitor', 'TournamentGlobal'];

CompetitorsCreateCtrl = ($scope, $location, Competitor) ->
  $scope.save = ->
    Competitor.save $scope.competitor, (competitor) ->
      $location.path "/competitors/#{competitor.id}/edit"

CompetitorsCreateCtrl.$inject = ['$scope', '$location', 'Competitor'];

CompetitorsShowCtrl = ($scope, $location, $routeParams, Competitor, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal

  Competitor.get
    id: $routeParams.id
  , (competitor) ->
    @original = competitor
    $scope.competitor = new Competitor(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.competitor.destroy ->
        $location.path "/competitors"

CompetitorsShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Competitor', 'TournamentGlobal'];

CompetitorsEditCtrl = ($scope, $location, $routeParams, Competitor) ->
  Competitor.get
    id: $routeParams.id
  , (competitor) ->
    @original = competitor
    $scope.competitor = new Competitor(@original)

  $scope.isClean = ->
    console.log "[CompetitorsEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.competitor

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.competitor.destroy ->
        $location.path "/competitors"

  $scope.save = ->
    Competitor.update $scope.competitor, (competitor) ->
      $location.path "/competitors"

CompetitorsEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Competitor'];

# exports
root.CompetitorsIndexCtrl  = CompetitorsIndexCtrl
root.CompetitorsCreateCtrl = CompetitorsCreateCtrl
root.CompetitorsShowCtrl   = CompetitorsShowCtrl
root.CompetitorsEditCtrl   = CompetitorsEditCtrl 
