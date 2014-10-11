account = angular.module 'resources.stats', ['ngResource']

account.factory 'Stats', ['$resource', ($resource) ->
  $resource 'stats/', {},
    query:
      isArray: false
]
