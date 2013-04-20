
root = global ? window

FieldFightsIndexCtrl = ($scope, Fight) ->
  #$scope.field_fights = Fight.field_fights() #query()

        
FieldFightsIndexCtrl.$inject = ['$scope', 'Fight']; 

# exports
root.FieldFightsIndexCtrl  = FieldFightsIndexCtrl
