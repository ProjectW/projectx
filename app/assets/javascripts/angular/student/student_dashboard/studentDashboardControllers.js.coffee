studentDashboardControllers = angular.module 'studentDashboardControllers', []

studentDashboardControllers.controller 'DashboardCtrl', ['$scope', '$http', 'Resume', 'Review', 'Account', ($scope, $http, Resume, Review, Account) ->
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

studentDashboardControllers.controller 'ReviewCtrl', ['$scope', ($scope) ->
  $scope.text = "hello, world!"
]
