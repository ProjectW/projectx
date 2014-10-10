adminControllers = angular.module 'adminControllers', []

adminControllers.controller 'DashboardCtrl',
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

