app = angular.module 'companyProfileApp', ['ngRoute','companyProfileControllers']

companyProfileApp.config ['$routeProvider', ($routeProvider) -> 
  $routeProvider
    .when('/:id', 
      templateUrl: '<%= asset_path("angular/student/company_profile/views/profileView") %>'
    )
    # .when('/resumes/:resumeId', 
    #   templateUrl: '<%= asset_path("angular/student/student_dashboard/views/resumeView") %>',
    #   controller: 'ResumeCtrl'
    # )
]
