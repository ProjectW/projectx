company = angular.module 'resources.companies', ['ngResource']

company.factory 'Company', ['$resource', ($resource) ->
  $resource 'companies/:id', { id: '@id' },
    reviews:
      url: 'companies/:id/reviews'
      method: 'GET'
      params:
        id: '@id'
      isArray: true
    search:
      url: 'companies/search'
      method: 'GET'
      isArray: true
    view:
      url: 'companies/:id/view'
      method: 'POST'
    watch:
      url: 'companies/:id/watch'
      method: 'POST'
    mostReviewed:
      url: 'companies/most_reviewed'
      method: 'GET'
      isArray: true
    mostViewed:
      url: 'companies/most_viewed'
      method: 'GET'
      isArray: true
]
