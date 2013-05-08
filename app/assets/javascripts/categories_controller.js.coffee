
root = global ? window

CategoriesIndexCtrl = ($scope, Category, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal
  $scope.categories = Category.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @category
      @category.destroy ->
        $scope.categories = _.without($scope.categories, original)
        
CategoriesIndexCtrl.$inject = ['$scope', 'Category', 'TournamentGlobal'];

CategoriesCreateCtrl = ($scope, $location, Category) ->
  $scope.category = new Category()
  $scope.save = ->
    Category.save $scope.category, (category) ->
      $location.path "/categories/#{category.id}/edit"

CategoriesCreateCtrl.$inject = ['$scope', '$location', 'Category'];

CategoriesShowCtrl = ($scope, $location, $routeParams, Category, TournamentGlobal) ->
  $scope.TournamentGlobal = TournamentGlobal

  Category.get
    id: $routeParams.id
  , (category) ->
    @original = category
    $scope.category = new Category(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.category.destroy ->
        $location.path "/categories"

CategoriesShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Category', 'TournamentGlobal'];

CategoriesEditCtrl = ($scope, $location, $routeParams, Category) ->
  Category.get
    id: $routeParams.id
  , (category) ->
    @original = category
    $scope.category = new Category(@original)

  $scope.isClean = ->
    console.log "[CategoriesEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.category

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.category.destroy ->
        $location.path "/categories"

  $scope.save = ->
    Category.update $scope.category, (category) ->
      $location.path "/categories"

CategoriesEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Category'];

# exports
root.CategoriesIndexCtrl  = CategoriesIndexCtrl
root.CategoriesCreateCtrl = CategoriesCreateCtrl
root.CategoriesShowCtrl   = CategoriesShowCtrl
root.CategoriesEditCtrl   = CategoriesEditCtrl 
