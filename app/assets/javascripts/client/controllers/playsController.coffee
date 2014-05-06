angular.module('roleFinder')
  .controller 'playsCtrl', ($scope) ->
    $scope.plays = [
      {id: 1, title: "Rent"},
      {id: 2, title: "Wicked"},
      {id: 3, title: "Fiddler on the Roof"}
    ]
