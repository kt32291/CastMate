app.controller('PlaysController', ['$scope', '$http',
  function PlaysController($scope, $http) {
    $scope.plays = [];

    $http.get('/json_plays').success(function (data) {
            $scope.plays = data;
         })
         .error(function (data, status, headers, config) {
             //  Do some error handling here
         });

    $scope.roles = [];

    $http.get('/json_roles').success(function (data) {
            $scope.roles = data;
         })
         .error(function (data, status, headers, config) {
             //  Do some error handling here
         });

    $scope.theatres = [];

    $http.get('/json_theatres').success(function (data) {
            $scope.theatres = data;
         })
         .error(function (data, status, headers, config) {
             //  Do some error handling here
         });

  }
]);

