studentDashboardControllers = angular.module 'studentDashboardControllers', []

studentDashboardControllers.controller 'StudentDashboardCtrl', ['$scope', '$http', 'Resume', ($scope, $http, Resume) ->
  $scope.resumes = Resume.getAll()
  $scope.orderProp = 'name'
]

studentDashboardControllers.controller 'ResumeCtrl', ['$scope', '$routeParams', ($scope, $routeParams) ->
  $scope.resumeId = $routeParams.resumeId
]
