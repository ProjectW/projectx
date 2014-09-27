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
        'salary',
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
          alert("You're missing some fields!")
        else
          $scope.review.companyId = 
          Review.save $scope.review, (() -> $location.path("/")), (v, r) ->
            alert "Error: " + if v.data then v.data.message else v
  ]

studentDashboardControllers.controller 'EditCtrl',
  [
    '$scope',
    'Account',
    ($scope, Account) ->
      $scope.account = Account.get()
      $scope.save = () ->
        Account.save $scope.account, (->), (v,r) ->
          alert "Error: " + if v.data then v.data.message else v
  ]
