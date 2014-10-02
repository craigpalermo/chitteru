# Chitter U Website

This is the website for Chitter U. It uses a NodeJS backend.
This project is written in Jade, Stylus, and CoffeeScript,
which replace HTML, CSS, and CoffeeScript (respectively).
Changes to Jade and Stylus files do not require anything
to be recompiled, as this is handle for you by the Node server.
CoffeeScript files MUST be recompiled before changes will
take effect (see below).

## Setup

**Complete these steps before doing anything else.**

Before setting up, ensure that the following dependencies
are installed on the server:
* NodeJS
* NPM

```
$ sudo apt-get install nodejs npm
```

Next, run the build script to install NodeJS and front-end
packages, and compile app.coffee (the Node server).

```
$ sudo chmod +x build.sh
$ sudo ./build.sh
```

# Running the server
To start the server, run this command:

```
$ nodejs src/app.js
```

As with any NodeJS app, the server will only continue to run
as long as this process remains active.

## Making Changes

### Adding team members
To add/remove/edit the info shown on the Team page, simply
edit the info in **src/team.json**. Each team member's data
is stored in the following format:

```json
{
    "imageUrl": "/img/team/<firstName>.jpg",
    "name": "<Firstname Lastname>",
    "school": "<School name>",
    "bio": "<Insert bio here>"
}
```

team.js is loaded once every time the server is started, so
changes made to this file will not come into effect until
the server is restarted.

Note: Team member photos should be 260x260 pixels to keep
the design consistent.

### Adding promo codes

Promo codes will be added on the Chitter backend. The only additional setup
that needs to be done to support new schools on the rankings page is to
add the image (PNG w/ transparent background, for consistency), to to
to the **src/public/img/logos directory**. The name of the new school and
that path to its corresponding image should then be added to the controller
for the rankings page (located in **src/coffee/controllers.coffee**).

### Modifying app.coffee
If changes to the server (app.coffee) are required, make
the necessary edits to **coffee/app.coffee**, then recompile
that file (and the other files in src/coffee) by running:
```
$ grunt coffee
```
