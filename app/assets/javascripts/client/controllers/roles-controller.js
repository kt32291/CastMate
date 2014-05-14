app.controller('RolesController', ['$scope', '$http',
  function RolesController($scope, $http) {
    $scope.roles = [];

    $http.get('/json_roles').success(function (data) {
            $scope.roles = data;
         })
         .error(function (data, status, headers, config) {
             //  Do some error handling here
         });

  }
]);
