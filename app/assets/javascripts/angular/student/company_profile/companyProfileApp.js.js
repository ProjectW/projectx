// Generated by CoffeeScript 1.8.0
var app;

app = angular.module('companyProfileApp', ['ngRoute', 'companyProfileControllers']);

companyProfileApp.config([
  '$routeProvider', function($routeProvider) {
    return $routeProvider.when('/:id', {
      templateUrl: '<%= asset_path("angular/student/company_profile/views/profileView") %>'
    });
  }
]);