# module dependencies
express = require('express')
stylus = require('stylus')
nib = require('nib')

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

# Routes
app.get('/', home)
app.get('/about', about)
app.get('/team', team)
app.get('/rankings', rankings)

# listen server on port 3000
app.listen(3000)
