studentDashboardControllers = angular.module 'studentDashboardControllers', []

studentDashboardControllers.controller 'StudentDashboardCtrl', ['$scope', '$http', 'Resume', 'Review', 'Account', ($scope, $http, Resume, Review, Account) ->
  $scope.resume = Resume.current()
  $scope.companyViews = Account.companyViews()
  $scope.reviews = Review.query()

  $scope.toggleContactable = (review) ->
    review.contactable = !review.contactable
    review.$update {}, (->) , (v, r) ->
      # FIXME shouldn't have to get response from server
      review.contactable = !review.contactable
      alert "Error: " + if v.data then v.data.message else v

]

studentDashboardControllers.controller 'ResumeCtrl', ['$scope', '$routeParams', ($scope, $routeParams) ->
  $scope.resumeId = $routeParams.resumeId
]
