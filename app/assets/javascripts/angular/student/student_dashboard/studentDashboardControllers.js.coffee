studentDashboardControllers = angular.module 'studentDashboardControllers', []

studentDashboardControllers.controller 'DashboardCtrl',
  [
    '$scope',
    '$http',
    'Resume',
    'Review',
    'Account',
    ($scope, $http, Resume, Review, Account) ->
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
    'Review',
    ($scope, $location, Review) ->
      $scope.review = {}

      requiredInputs = [
        'positionTitle',
        'numberInterns',
        'numberHours',
        'projects',
        'mentorship',
        'season',
        'recommend',
        'story',
        'culture',
        'location'
      ]

      $scope.submit = () ->
        missing = []
        for requiredInput in requiredInputs
          if not $scope.review[requiredInput]
            missing[missing.length] = requiredInput
        if missing.length
          errors = []
          for field in missing
            errors[errors.length] = "Missing " + field + " field"
          $scope.errors = errors
        else if not typeof($scope.review.company) == 'object'
          errors = ["Please start typing your company's name and then select one from the dropdown."]
          $scope.errors = errors
        else
          $scope.review.companyId = $scope.review.company.id
          Review.save $scope.review, (() -> $location.path("/")), (v, r) ->
            alert "Error: " + if v.data then v.data.message else v
  ]

studentDashboardControllers.controller 'EditCtrl',
  [
    '$scope',
    '$location',
    'Account',
    ($scope, $location, Account) ->
      $scope.account = Account.get()
      $scope.save = () ->
        Account.save $scope.account, (=> $location.path("/")), (v,r) ->
          alert "Error: " + if v.data then v.data.message else v
  ]