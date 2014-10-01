studentDashboardControllers = angular.module 'studentDashboardControllers', []

studentDashboardControllers.controller 'DashboardCtrl',
  [
    '$scope',
    '$http',
    '$window',
    'Resume',
    'Review',
    'Account',
    ($scope, $http, $window, Resume, Review, Account) ->
      $window.onbeforeunload = null
      $scope.account = Account.get()
      $scope.resume = Resume.current()
      $scope.reviews = Review.query()
      $scope.companyViews = Account.companyViews()

      $scope.toggleContactable = (review) ->
        review.contactable = !review.contactable
        review.$update {}, (->) , (v, r) ->
          # FIXME shouldn't have to get response from server
          review.contactable = !review.contactable
          alert "Error: " + if v.data then v.data.message else v
  ]

studentDashboardControllers.controller 'ReviewCtrl',
  [
    '$scope',
    '$location',
    '$window',
    '$anchorScroll',
    'Review',
    ($scope, $location, $window, $anchorScroll, Review) ->
      $window.onbeforeunload = () -> "Your changes will not be saved."

      $scope.review = {}
      $scope.errors = []

      REQUIRED_INPUTS = [
        'positionTitle',
        'season',
        'recommend',
        'location'
      ]

      EARLIEST_YEAR = 2000
      LATEST_YEAR = 2014

      isValid = (review) ->
        errors = []

        for requiredInput in REQUIRED_INPUTS
          if not review[requiredInput]
            errors[errors.length] = "Missing " + requiredInput + " field"

        if not typeof(review.company) == 'object'
          errors[errors.length] = "Please start typing your company's name and then select one from the dropdown."

        if review.year < EARLIEST_YEAR || LATEST_YEAR < review.year
          errors[errors.length] = "The year you entered is invalid."

        $scope.errors = errors
        $scope.errors.length == 0

      $scope.submit = () ->
        if isValid($scope.review)
          $scope.review.companyId = $scope.review.company.id
          Review.save $scope.review, (() -> $location.path("/")), (v, r) ->
            alert "Error: " + if v.data then v.data.message else v
        else
          $anchorScroll()
  ]

studentDashboardControllers.controller 'EditCtrl',
  [
    '$scope',
    '$location',
    '$window',
    'Account',
    ($scope, $location, $window, Account) ->
      $window.onbeforeunload = null
      $scope.account = Account.get()
      $scope.save = () ->
        Account.save $scope.account, (=> $location.path("/")), (v,r) ->
          alert "Error: " + if v.data then v.data.message else v
  ]