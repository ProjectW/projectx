studentDashboardControllers = angular.module 'studentDashboardControllers', ['ngAnimate']

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
      $scope.errors = []
      $scope.account = Account.get()
      $scope.resume = Resume.current()
      $scope.reviews = Review.query()
      $scope.companyViews = Account.companyViews()

      $scope.toggleContactable = (review) ->
        review.contactable = !review.contactable
        review.$contactable {}, (->) , (v, r) ->
          review.contactable = !review.contactable
          alert "Error: " + if v.data then v.data.message else v

      Account.companyWatches {},
        (r, v) ->
          $scope.companyWatches = r
        (r, v) ->
          $scope.errors[$scope.errors.length] = r
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

      $scope.step = 0
      MAX_STEP = 3

      REQUIRED_INPUTS = [
        'company',
        'location',
        'positionTitle',
        'season',
        'year',
        'recommend'
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

      $scope.selectOriginal = (result) ->
        result.originalObject

      $scope.moveStep = () ->
        $scope.step = Math.min($scope.step + 1, MAX_STEP)

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