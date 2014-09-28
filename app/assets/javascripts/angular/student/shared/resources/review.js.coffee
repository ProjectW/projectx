resumes = angular.module 'resources.reviews', ['ngResource']

resumes.factory 'Review', ['$resource', ($resource) ->
  $resource 'reviews/:id', { id: '@id' },
    # query:
    #   method: 'GET'
    #   isArray: true
    update:
      method: 'PUT'
      params:
        id: '@id'
      # TODO return now has to be all the values...
    get:
      url: 'reviews/:id'
      method: 'GET'
      # params:
      #   id: '@id'
]
