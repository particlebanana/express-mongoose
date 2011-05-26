express = require 'express'
path = require 'path'
messages = require 'express-messages'
stylus = require 'stylus'
nib = require 'nib'

Server = {}
application_root = __dirname

global.Server = Server
Server.root = application_root
global.app = express.createServer()

Server.setup = require('./lib/setup.coffee').setup(
  app: app 
  mongoose : require "mongoose"
  express : express
  stylus : require "stylus"
  messages : require 'express-messages'
  paths : 
    app : path.join(application_root,"app")
    views :  path.join(application_root,"app","views")
    stylesheets :  path.join(application_root,"app","stylesheets")
    root : path.join(application_root,"public")
    controllers : path.join(application_root,"app","controllers")
    models : path.join(application_root,"app","models")
)