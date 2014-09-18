companyProfileControllers = angular.module 'companyProfileControllers', []

companyProfileControllers.controller 'CompanySearchCtrl', ['$scope', '$http', 'Company', ($scope, $http, Company) ->
  $scope.searchText
  $scope.companies = []
  $scope.search = () ->
    Company.search({ searchText: $scope.searchText}, (r, v) ->
      $scope.companies = r
    )
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
