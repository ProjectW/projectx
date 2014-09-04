company = angular.module 'resources.companies', ['ngResource']

company.factory 'Company', ['$resource', ($resource) ->
  $resource 'companies/:id', { id: '@id' },
    reviews:
      url: 'companies/:id/reviews'
      method: 'GET'
      params:
        id: '@id'
      isArray: true
]
