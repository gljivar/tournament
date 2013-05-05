
root = global ? window

UsersIndexCtrl = ($scope, User, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal
  $scope.users = User.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @user
      @user.destroy ->
        $scope.users = _.without($scope.users, original)
        
UsersIndexCtrl.$inject = ['$scope', 'User', 'TournamentGlobal'];

UsersCreateCtrl = ($scope, $location, User) ->
  $scope.save = ->
    User.save $scope.user, (user) ->
      $location.path "/users/#{user.id}/edit"

UsersCreateCtrl.$inject = ['$scope', '$location', 'User'];

UsersShowCtrl = ($scope, $location, $routeParams, User, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal

  User.get
    id: $routeParams.id
  , (user) ->
    @original = user
    $scope.user = new User(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.user.destroy ->
        $location.path "/users"

UsersShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'User', 'TournamentGlobal'];

UsersEditCtrl = ($scope, $location, $routeParams, User) ->
  User.get
    id: $routeParams.id
  , (user) ->
    @original = user
    $scope.user = new User(@original)

  $scope.isClean = ->
    console.log "[UsersEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.user

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.user.destroy ->
        $location.path "/users"

  $scope.save = ->
    User.update $scope.user, (user) ->
      $location.path "/users"

UsersEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'User'];

# exports
root.UsersIndexCtrl  = UsersIndexCtrl
root.UsersCreateCtrl = UsersCreateCtrl
root.UsersShowCtrl   = UsersShowCtrl
root.UsersEditCtrl   = UsersEditCtrl 
