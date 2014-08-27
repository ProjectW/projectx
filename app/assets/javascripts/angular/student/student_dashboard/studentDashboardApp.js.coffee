app = angular.module 'studentDashboardApp', []

app.controller 'studentDashboardController', ['$scope', ($scope) -> 
    $scope.todos = [
      text: 'learn angular'
      done: true
    ]
  ]
