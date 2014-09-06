app = angular.module('myApp', [])

app.controller 'MemberCtrl', ($scope) ->
  $scope.teamMembers = teamMembers

app.controller 'RankCtrl', ($scope) ->
  # get data
  data =  [
            {
              name: "University of Maryland",
              orgs: [
                  {
                    name: "Org 1",
                    points: 10
                  }
              ]
            },
            {
              name: "University of Virginia",
              orgs: [
                  {
                    name: "Org 1",
                    points: 10
                  },
                  {
                    name: "Org 2",
                    points: 15
                  }
              ]
            },
            {
              name: "University of South Florida",
              orgs: [
                  {
                    name: "Org 1",
                    points: 10
                  },
                  {
                    name: "Org 2",
                    points: 15
                  },
                  {
                    name: "Cool Org",
                    points: 20
                  }
              ]
            }
          ]

  # calculate rankings
  schools = []
  score = 0

  for school in data
    for org in school.orgs
      score += org.points
   
    schools.push {"name": school.name, "score": score}
    score = 0

  console.log schools
  $scope.data = data
  $scope.schools = schools
