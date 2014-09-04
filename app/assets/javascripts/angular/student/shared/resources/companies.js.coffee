company = angular.module 'resources.companies', ['ngResource']

company.factory 'Company', ['$resource', ($resource) ->
  $resource 'companies/:id', {},
    query:
      method: 'GET'
    reviews:
      url: 'companies/:id/reviews'
      method: 'GET'
      params: 
        id: '@id'
      isArray: true
]