resumes = angular.module 'resources.resumes', ['ngResource']

resumes.factory 'Resume', ['$resource', ($resource) ->
  $resource 'resumes/', {},
    getAll:
      method: 'GET'
      isArray: true
]
