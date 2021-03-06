
root = global ? window

RepeaterIndexCtrl = ($scope, Fight, Field) ->
  index = 0 
  repeaterId = undefined
  
  $scope.$on('$destroy', ->
   clearInterval(repeaterId) if repeaterId isnt `undefined`
  )

  getNextFieldFights = ->
     $scope.field = fields[index]
     $scope.field_fights = Fight.repeater(
       id : fields[index].id
       timestamp: (new Date()).getTime()
     )
     index = index + 1
     index = index % fields.length

  fields = Field.query(->
   getNextFieldFights()

   repeaterId = setInterval (->
     getNextFieldFights()
   ), 5000
  )

  #$scope.field_fights = Fight.repeater id : fields[index].id

  $scope.save = (fight, competitor_winner_id) ->
    fight.competitor_winner_id = competitor_winner_id
    Fight.update fight, (fight) ->
      $scope.field_fights = Fight.field_fights()

  $scope.isCurrentFight = (fight, fights) ->
    current_fight = null 
    for f in fights then do (f) =>
      current_fight = f if f.competitor_winner_id == null and current_fight == null
    current_fight = fight if current_fight == null
    return current_fight == fight
          
RepeaterIndexCtrl.$inject = ['$scope', 'Fight', 'Field']; 

# exports
root.RepeaterIndexCtrl  = RepeaterIndexCtrl
