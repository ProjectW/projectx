companyProfileControllers = angular.module 'companyProfileControllers', []

companyProfileControllers.controller 'CompanySearchCtrl', ['$scope', '$http', 'Company', ($scope, $http, Company) ->
  $scope.searchText

  $scope.companies = []

  # TODO debounce me
  $scope.search = () ->
    if not $scope.searchText
      $scope.companies = []
      return

    Company.search({ searchText: $scope.searchText}, (r, v) ->
      $scope.companies = r
    )
]

companyProfileControllers.controller 'CompanyProfileCtrl', ['$scope', '$routeParams', '$http', 'Company', ($scope, $routeParams, $http, Company) ->
  companyId = $routeParams.companyId
  company = Company.get({ id: companyId }, (company) ->
    $scope.company = company
    Company.view({ id: companyId }) # TODO handle errors
  )
  $scope.reviews = Company.reviews({ id: companyId })
]
