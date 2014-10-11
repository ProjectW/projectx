sharedDirectives = angular.module 'sharedDirectives', []

sharedDirectives.directive 'ppShowErrors', () ->
  template: "<div ng-repeat='error in errors'>{{ error }} </div>"
