studentDashboardControllers = angular.module 'studentDashboardControllers', []

studentDashboardControllers.controller 'StudentDashboardCtrl', ['$scope', '$http', 'Resume', 'Review', ($scope, $http, Resume, Review) ->
  $scope.resume = Resume.current()
  $scope.reviews = Review.query()
  $scope.toggleContactable = (review) ->
    review.contactable = !review.contactable
    review.$update({}, (->) , (v, r) ->
      review.contactable = !review.contactable
      alert "Error: " + if v.data then v.data.message else v
    )
]

studentDashboardControllers.controller 'ResumeCtrl', ['$scope', '$routeParams', ($scope, $routeParams) ->
  $scope.resumeId = $routeParams.resumeId
]
