companyProfileControllers = angular.module 'companyProfileControllers', []

companyProfileControllers.controller 'CompanyProfileCtrl', ['$scope', '$http', 'Company', ($scope, $http, Company) ->
  $scope.company = new Company({id: 123})
  $scope.reviews = $scope.company.reviews()
]