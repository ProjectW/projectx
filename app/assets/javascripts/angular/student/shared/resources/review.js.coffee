resumes = angular.module 'resources.reviews', ['ngResource']

resumes.factory 'Review', ['$resource', ($resource) ->
  $resource 'reviews/', {},
    query:
      method: 'GET'
      isArray: true
    update:
      url: 'reviews/:id'
      method: 'PUT'
      params:
        id: '@id'
      # TODO return now has to be all the values...
]
