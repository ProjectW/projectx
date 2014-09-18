companyProfileControllers = angular.module 'companyProfileControllers', []

companyProfileControllers.controller 'CompanySearchCtrl', ['$scope', '$http', ($scope, $http) ->
  $scope.text = "hello, world!"
]

companyProfileControllers.controller 'CompanyProfileCtrl', ['$scope', '$routeParams', '$http', 'Company', ($scope, $routeParams, $http, Company) ->
  companyId = $routeParams.companyId
  company = Company.get({ id: companyId }, (company) ->
    $scope.company = company
  )
  # NOTE you MUST call reviews as a static function
  $scope.reviews = Company.reviews({ id: companyId }, (reviews) ->
    $scope.review = reviews[0]
  )
]
