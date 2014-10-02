# module dependencies
express = require('express')
stylus  = require('stylus')
nib     = require('nib')
http    = require('http')

compile = (str, path) ->
    stylus(str).set('filename', path).use(nib())

# set up app
app = module.exports = express()

app.set('views', __dirname + '/views')
app.set('view engine', 'jade')
app.use(express.logger('dev'))
app.use(stylus.middleware( {
            src: __dirname + '/public' ,
            compile: compile
        } ))
app.use(express.static(__dirname + '/public'))
app.use(express.urlencoded())
app.use(express.json())

# home page
home = (req, res) ->
    res.render('main', { title : 'Home' })

# about page
about = (req, res) ->
    res.render('about', { title : 'About' })

# team page

# load team members json file
fs = require("fs")
teamMembers = (JSON.parse(fs.readFileSync("src/team.json", "utf8")))

team = (req, res) ->
  res.render('team', { title : 'Team', teamMembers: teamMembers })

# rankings page
rankings = (req, res) ->
  res.render('rankings', { title : 'Rankings' })

{parseString} = require 'xml2js'

# get promo codes
codes = (req, resp) ->
  # make request to chitter api
  url = "http://chittersite.appspot.com/Chitter?_query=promoCodes"
  http.get(url, (res) ->
    body = ''

    res.on('data', (chunk) ->
      body += chunk
    )

    res.on('end', ->
      xml = body

      # parse xml response to json
      parseString xml, (err, result) ->
        result = result.top.PromoCode
        orgsBySchool = {}

        # format results
        for key, val of result
          newCode = {
                      personName: val.$.personName
                      promoCode:  val.$.promoCode
                      promoNum:   val.$.promoNum
                    }

          if val.$.school of orgsBySchool
            orgsBySchool[val.$.school].push(newCode)
          else
            orgsBySchool[val.$.school] = [newCode]

        # return results as json
        resp.json(orgsBySchool)
    )
  ).on('error', (e) ->
    console.log("Got error: ", e)
  )

# Routes
app.get('/', home)
app.get('/about', about)
app.get('/team', team)
app.get('/rankings', rankings)
app.get('/get_promo_codes', codes)

# listen server on port 3000
app.listen(3000)
