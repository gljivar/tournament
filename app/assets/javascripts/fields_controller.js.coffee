
root = global ? window

FieldsIndexCtrl = ($scope, Field) ->
  $scope.fields = Field.query()

  $scope.destroy = ->
    if confirm("Are you sure?")
      original = @field
      @field.destroy ->
        $scope.fields = _.without($scope.fields, original)
        
FieldsIndexCtrl.$inject = ['$scope', 'Field'];

FieldsCreateCtrl = ($scope, $location, Field) ->
  $scope.save = ->
    Field.save $scope.field, (field) ->
      $location.path "/fields/#{field.id}/edit"

FieldsCreateCtrl.$inject = ['$scope', '$location', 'Field'];

FieldsShowCtrl = ($scope, $location, $routeParams, Field) ->
  Field.get
    id: $routeParams.id
  , (field) ->
    @original = field
    $scope.field = new Field(@original)

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.field.destroy ->
        $location.path "/fields"

FieldsShowCtrl.$inject = ['$scope', '$location', '$routeParams', 'Field'];

FieldsEditCtrl = ($scope, $location, $routeParams, Field) ->
  Field.get
    id: $routeParams.id
  , (field) ->
    @original = field
    $scope.field = new Field(@original)

  $scope.isClean = ->
    console.log "[FieldsEditCtrl, $scope.isClean]"
    angular.equals @original, $scope.field

  $scope.destroy = ->
    if confirm("Are you sure?")
      $scope.field.destroy ->
        $location.path "/fields"

  $scope.save = ->
    Field.update $scope.field, (field) ->
      $location.path "/fields"

FieldsEditCtrl.$inject = ['$scope', '$location', '$routeParams', 'Field'];

# exports
root.FieldsIndexCtrl  = FieldsIndexCtrl
root.FieldsCreateCtrl = FieldsCreateCtrl
root.FieldsShowCtrl   = FieldsShowCtrl
root.FieldsEditCtrl   = FieldsEditCtrl 