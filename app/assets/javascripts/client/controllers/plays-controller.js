app.controller('PlaysController', ['$scope', '$http',
  function PlaysController($scope, $http) {
    $scope.plays = [
      {id: 1, title: "Rent"},
      {id: 2, title: "Wicked"},
      {id: 3, title: "Fiddler on the Roof"}
    ];
  }
]);

