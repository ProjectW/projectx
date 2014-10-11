adminControllers = angular.module 'adminControllers', []

adminControllers.controller 'StatsCtrl',
  [
    '$scope',
    '$http',
    'Stats'
    ($scope, $http, Stats) ->
      Stats.query {}, (r, v) ->
        $scope.stats = r

      # $scope.downloadAll = () ->
      #   $http.get('all_resumes', {
      #     headers:
      #       'Content-Type': 'application/zip'
      #   }).success((->)).error((data, status) -> $scope.errors[data])

      # $scope.downloadCurrent = () ->
      #   $http.get('current_resumes').success((->)).error((data, status) -> $scope.errors[data])
  ]

