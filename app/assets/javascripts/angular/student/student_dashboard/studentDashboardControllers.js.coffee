studentDashboardControllers = angular.module 'studentDashboardControllers', []

studentDashboardControllers.controller 'StudentDashboardCtrl', ['$scope', '$http', 'Resume', 'Review', ($scope, $http, Resume, Review) ->
  $scope.resumes = Resume.query()
  $scope.reviews = Review.query()
  $scope.orderProp = 'name'
]

studentDashboardControllers.controller 'ResumeCtrl', ['$scope', '$routeParams', ($scope, $routeParams) ->
  $scope.resumeId = $routeParams.resumeId
]
