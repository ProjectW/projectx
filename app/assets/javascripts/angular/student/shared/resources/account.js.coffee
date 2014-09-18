account = angular.module 'resources.account', ['ngResource']

account.factory 'Account', ['$resource', ($resource) ->
  $resource 'account/', {},
]
