companyProfileControllers = angular.module 'companyProfileControllers', []

companyProfileControllers.controller 'CompanySearchCtrl', ['$scope', '$http', 'Company', ($scope, $http, Company) ->
  KEY_UP = 38
  KEY_DOWN = 40

  $scope.searchText

  $scope.companies = []

  $scope.selected = 0

  $scope.select = (e) ->
    switch e.keyCode
      when KEY_UP
        $scope.selected = Math.max($scope.selected - 1, 0)
      when KEY_DOWN
        $scope.selected = Math.min($scope.selected + 1, $scope.companies.length - 1)

  # TODO debounce me
  $scope.search = (e) ->
    if e.keyCode == KEY_UP or e.keyCode == KEY_DOWN
      return

    $scope.selected = 0

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
