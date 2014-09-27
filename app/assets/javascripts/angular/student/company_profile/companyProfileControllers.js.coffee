companyProfileControllers = angular.module 'companyProfileControllers', []

companyProfileControllers.controller 'CompanySearchCtrl',
  [
    '$scope',
    '$location',
    '$http',
    'Company',
    ($scope, $location, $http, Company) ->
      KEY_UP = 38
      KEY_DOWN = 40
      ENTER = 13

      $scope.searchText

      $scope.companies = []

      $scope.selected = 0

      $scope.select = (e) ->
        switch e.keyCode
          when KEY_UP
            $scope.selected = Math.max($scope.selected - 1, 0)
          when KEY_DOWN
            $scope.selected = Math.min($scope.selected + 1, $scope.companies.length - 1)
          when ENTER
            $location.path "/" + $scope.companies[$scope.selected].id

      # TODO debounce me
      $scope.search = (e) ->
        switch e.keyCode
          when KEY_UP, KEY_DOWN, ENTER
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

  $scope.currentIndex = 0;

  $scope.next = () ->
    (if $scope.currentIndex < $scope.company.reviews.count - 1 then $scope.currentIndex++ else $scope.currentIndex = 0)

  $scope.prev = () -> 
    (if $scope.currentIndex > 0 then $scope.currentIndex-- else $scope.currentIndex = $scope.reviews)

  $scope.$watch 'currentIndex', () ->
    $scope.reviews.forEach (review) -> 
      review.visible = false
    $scope.reviews[$scope.currentIndex].visible = true;
]
