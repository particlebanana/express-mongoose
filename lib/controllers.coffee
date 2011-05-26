_ = require 'underscore'

module.exports = Server.controllers = {
  controller_objects : {}
}

Server.controllers.autoload = (db) ->
  fs = require "fs"
  path = require "path"
  sys = require "sys"
  files = fs.readdirSync Server.paths.controllers
  util = require "./util"
  names = _.map(files,(f) ->
    return path.basename f
  )

  _.each(names, (controller) ->
    c_id = util.camelize( controller.replace(/.js$/,'') )
    Server.controllers.controller_objects[c_id] = 
      require( Server.paths.controllers + "/" + controller )
  )