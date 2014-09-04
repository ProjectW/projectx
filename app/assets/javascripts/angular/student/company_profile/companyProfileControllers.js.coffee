companyProfileControllers = angular.module 'companyProfileControllers', []

companyProfileControllers.controller 'CompanyProfileCtrl', ['$scope', '$routeParams', '$http', 'Company', ($scope, $routeParams, $http, Company) ->
  $scope.companyId = $routeParams.companyId
  $scope.company = new Company(id: $scope.companyId)
  $scope.reviews = $scope.company.$reviews()
]