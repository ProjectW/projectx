resumes = angular.module 'resources.reviews', ['ngResource']

resumes.factory 'Review', ['$resource', ($resource) ->
  $resource 'reviews/:id', { id: '@id' },
    contactable:
      url: 'reviews/:id/contactable'
      method: 'PUT'
      params:
        id: '@id'
    update:
      method: 'PUT'
      params:
        id: '@id'
    get:
      url: 'reviews/:id'
      method: 'GET'
    recent:
      url: 'reviews/recent'
      method: 'GET'
      isArray: true
]
