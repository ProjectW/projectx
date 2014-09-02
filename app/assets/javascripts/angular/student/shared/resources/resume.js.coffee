resumes = angular.module 'resources.resumes', ['ngResource']

resumes.factory 'Resume', ['$resource', ($resource) ->
  $resource 'resumes/', {},
    query:
      method: 'GET'
      isArray: true
]
