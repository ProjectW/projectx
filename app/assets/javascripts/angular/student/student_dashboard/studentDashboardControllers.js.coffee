studentDashboardControllers = angular.module 'studentDashboardControllers', []

studentDashboardControllers.controller 'StudentDashboardCtrl', ['$scope', '$http', ($scope, $http) ->
  $http.get('resumes')
    .success (data) ->
      $scope.resumes = data

  $scope.orderProp = 'name'
]

studentDashboardControllers.controller 'ResumeCtrl', ['$scope', '$routeParams', ($scope, $routeParams) ->
  $scope.resumeId = $routeParams.resumeId
]
