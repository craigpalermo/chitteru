app = angular.module('myApp', [])

app.controller 'MemberCtrl', ($scope) ->
  $scope.teamMembers = teamMembers

# define location of logo for each school
logoPrefix = "/img/logos/"
logos = {
          "University of Michigan":   "#{logoPrefix}michigan.png"
          "University of Maryland":   "#{logoPrefix}umd.png"
          "Rutgers University":       "#{logoPrefix}rutgers.png"
          "James Madison University": "#{logoPrefix}jmu.png"
          "Syracuse University":      "#{logoPrefix}syracuse.png"
          "Penn State University":    "#{logoPrefix}psu.png"
          "University of Virginia":   "#{logoPrefix}uva.png"
        }

app.controller 'RankCtrl', ($scope, $http) ->
  # get promo code data from api
  resp = $http(
    method: 'GET'
    url: "/get_promo_codes/"
  )
  resp.success (data) ->
    schools = []
    score = 0

    # compute score for each school
    for key, val of data
      for org in val
        score += parseInt org.promoNum
      newSchool = {"name": key, "score": score, "image": logos[key]}
      schools.push newSchool
      score = 0

    # add data to scope
    $scope.data = data
    $scope.schools = schools
  resp.error (data) ->
    console.log "Error occurred loading promo code data"
