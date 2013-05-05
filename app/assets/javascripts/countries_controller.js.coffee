
root = global ? window

CountriesIndexCtrl = ($scope, Country, TournamentGlobal, analytics) ->
  $scope.TournamentGlobal = TournamentGlobal
  $scope.countries = Country.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @country
      @country.destroy ->
        $scope.countries = _.without($scope.countries, original)
        
CountriesIndexCtrl.$inject = ['$scope', 'Country', 'TournamentGlobal'];

CountriesCreateCtrl = ($scope, $location, Country, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal
  $scope.save = ->
    Country.save $scope.country, (country) ->
      $location.path "/countries/#{country.id}/edit"

CountriesCreateCtrl.$inject = ['$scope', '$location', 'Country', 'TournamentGlobal'];

CountriesShowCtrl = ($scope, $location, $routeParams, Country, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal

  Country.get
    id: $routeParams.id
  , (country) ->
    @original = country
    $scope.country = new Country(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.country.destroy ->
        $location.path "/countries"

CountriesShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Country', 'TournamentGlobal'];

CountriesEditCtrl = ($scope, $location, $routeParams, Country, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal

  Country.get
    id: $routeParams.id
  , (country) ->
    @original = country
    $scope.country = new Country(@original)

  $scope.isClean = ->
    console.log "[CountriesEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.country

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.country.destroy ->
        $location.path "/countries"

  $scope.save = ->
    Country.update $scope.country, (country) ->
      $location.path "/countries"

CountriesEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Country', 'TournamentGlobal'];

# exports
root.CountriesIndexCtrl  = CountriesIndexCtrl
root.CountriesCreateCtrl = CountriesCreateCtrl
root.CountriesShowCtrl   = CountriesShowCtrl
root.CountriesEditCtrl   = CountriesEditCtrl 
