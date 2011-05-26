_ = require 'underscore'

module.exports = Server.models = {}

Server.models.autoload = (db) ->
  fs = require "fs"
  path = require "path"
  mongoose = require "mongoose"
  sys = require "sys"
  files = fs.readdirSync(Server.paths.models)
  names = _.map(files, (f) ->
    return path.basename f
  )

  _.each(names, (model) ->
    require( Server.paths.models + "/" + model )
  )
  #sys.puts(sys.inspect(Server.models))