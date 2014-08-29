app = angular.module 'companyProfileApp', []

app.controller 'companyProfileController', ['$scope', ($scope) -> 
    $scope.todos = [
      text: 'learn angular'
      done: true
    ]
  ]
