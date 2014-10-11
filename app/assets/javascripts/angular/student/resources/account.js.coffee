account = angular.module 'resources.account', ['ngResource']

account.factory 'Account', ['$resource', ($resource) ->
  $resource 'account/', {},
    companyViews:
      url: 'account/company_views'
      method: 'GET'
      isArray: true
    save:
      url: 'account/info'
      method: 'PUT'
]
