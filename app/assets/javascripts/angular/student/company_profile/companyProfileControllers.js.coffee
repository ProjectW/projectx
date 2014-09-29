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

      NAME = 'name'
      REVIEWS = '-reviewsCount'

      $scope.searchText

      $scope.companies = []

      # $scope.selected = 0

      $scope.pred = NAME

      # $scope.select = (e) ->
      #   switch e.keyCode
      #     when KEY_UP
      #       $scope.selected = Math.max($scope.selected - 1, 0)
      #     when KEY_DOWN
      #       $scope.selected = Math.min($scope.selected + 1, $scope.companies.length - 1)
      #     when ENTER
      #       $location.path "/" + $scope.companies[$scope.selected].id

      $scope.sort = (pred) ->
        $scope.pred = switch pred
          when 1
            NAME
          when 2
            REVIEWS
          else
            NAME

      # TODO debounce me
      $scope.search = (e) ->
        switch e.keyCode
          when KEY_UP, KEY_DOWN, ENTER
            return

        # $scope.selected = 0

        if not $scope.searchText
          $scope.companies = []
          return

        Company.search({ searchText: $scope.searchText}, (r, v) ->
          $scope.companies = r
        )

  ]

companyProfileControllers.controller 'CompanyProfileCtrl',
  [
    '$scope',
    '$routeParams',
    '$http',
    'Company',
    'Review',
    ($scope, $routeParams, $http, Company, Review) ->
      RECENT_TO_SHOW = 4

      companyId = $routeParams.companyId
      company = Company.get({ id: companyId }, (company) ->
        $scope.company = company
        Company.view({ id: companyId }) # TODO handle errors
      )


      $scope.reviews = Company.reviews({ id: companyId })

      $scope.currentIndex = 0;

      $scope.mostRecentReviews = () ->
        names = []
        iterLim = Math.min($scope.reviews.length, RECENT_TO_SHOW) - 1
        for i in [0..iterLim]
          names[names.length] = $scope.reviews[i].student.name
        names.join(", ")

      $scope.positiveReviews = () ->
        pos = 0
        for review in $scope.reviews
          if review.recommend
            pos = pos + 1
        pos

      $scope.expand = (review) ->
        if review.expanded
          review.expanded = false
          $scope.currentIndex = 0
          return

        $scope.reviews[$scope.currentIndex].expanded = false
        $scope.currentIndex = $scope.reviews.indexOf(review)

        if not review.loaded
          Review.get  { id: review.id },
                      (review) ->
                        review.loaded = true
                        review.expanded = true
                        $scope.reviews[$scope.currentIndex] = review
                      (r, v) ->
                        alert "Error: " + if v.data then v.data.message else v
        else
          review.expanded = true

      $scope.next = () ->
        $scope.currentIndex = Math.min $scope.company.reviewsCount - 1, $scope.currentIndex + 1

      $scope.prev = () ->
        $scope.currentIndex = Math.max 0, $scope.currentIndex - 1
  ]
