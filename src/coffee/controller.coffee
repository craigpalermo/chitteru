app = angular.module('myApp', [])

app.controller 'MemberCtrl', ($scope) ->
  $scope.teamMembers = teamMembers
