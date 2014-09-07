app = angular.module('myApp', [])

app.controller 'MemberCtrl', ($scope) ->
  $scope.teamMembers = teamMembers

# get data
data =  [
          {
            name: "University of Maryland",
            image: "/img/logos/umd.png",
            score: 15,
            orgs: [
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 2", points: 10},
            ]
          },
          {
            name: "University of Virginia",
            image: "/img/logos/uva.png",
            score: 25,
            orgs: [
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 2", points: 10},
            ]
          },
          {
            name: "Rutgers University",
            image: "/img/logos/rutgers.png",
            score: 3,
            orgs: [
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 2", points: 10},
            ]
          },
          {
            name: "University of Michigan",
            image: "/img/logos/michigan.png",
            score: 63,
            orgs: [
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 2", points: 10},
            ]
          },
          {
            name: "Syracuse University",
            image: "/img/logos/syracuse.png",
            score: 12,
            orgs: [
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 1", points: 15},
              {name: "org 1", points: 15},
              {name: "org 2", points: 10},
              {name: "org 2", points: 10},
            ]
          },
        ]

app.controller 'RankCtrl', ($scope) ->
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
