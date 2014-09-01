resumes = angular.module 'resources.reviews', ['ngResource']

resumes.factory 'Review', ['$resource', ($resource) ->
  $resource 'reviews/', {},
    query:
      method: 'GET'
      isArray: true
]
