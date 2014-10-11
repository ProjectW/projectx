adminControllers = angular.module 'adminControllers', []

adminControllers.controller 'StatsCtrl',
  [
    '$scope',
    '$http',
    'Stats'
    ($scope, $http, Stats) ->
      Stats.query {}, (r, v) ->
        $scope.stats = r
  ]

