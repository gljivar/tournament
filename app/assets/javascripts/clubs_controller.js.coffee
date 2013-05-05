
root = global ? window

ClubsIndexCtrl = ($scope, Club, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal
  $scope.clubs = Club.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @club
      @club.destroy ->
        $scope.clubs = _.without($scope.clubs, original)
        
ClubsIndexCtrl.$inject = ['$scope', 'Club', 'TournamentGlobal'];

ClubsCreateCtrl = ($scope, $location, Club) ->
  $scope.save = ->
    Club.save $scope.club, (club) ->
      $location.path "/clubs/#{club.id}/edit"

ClubsCreateCtrl.$inject = ['$scope', '$location', 'Club'];

ClubsShowCtrl = ($scope, $location, $routeParams, Club, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal
  Club.get
    id: $routeParams.id
  , (club) ->
    @original = club
    $scope.club = new Club(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.club.destroy ->
        $location.path "/clubs"

ClubsShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Club', 'TournamentGlobal'];

ClubsEditCtrl = ($scope, $location, $routeParams, Club) ->
  Club.get
    id: $routeParams.id
  , (club) ->
    @original = club
    $scope.club = new Club(@original)

  $scope.isClean = ->
    console.log "[ClubsEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.club

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.club.destroy ->
        $location.path "/clubs"

  $scope.save = ->
    Club.update $scope.club, (club) ->
      $location.path "/clubs"

ClubsEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Club'];

# exports
root.ClubsIndexCtrl  = ClubsIndexCtrl
root.ClubsCreateCtrl = ClubsCreateCtrl
root.ClubsShowCtrl   = ClubsShowCtrl
root.ClubsEditCtrl   = ClubsEditCtrl 
