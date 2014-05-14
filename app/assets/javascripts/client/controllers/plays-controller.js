app.controller('PlaysController', ['$scope', '$http',
  function PlaysController($scope, $http) {
    $scope.plays = [];

    $http.get('/json_plays').success(function (data) {
            $scope.plays = data;
         })
         .error(function (data, status, headers, config) {
             //  Do some error handling here
         });

  }
]);

