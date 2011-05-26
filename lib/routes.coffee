match = (url,handler,method) ->
  handler = handler || "site#index"
  
  parts = handler.split(/\#/)
  util = require './util'
  controller = parts.shift()
  action = parts.shift()
  sys = require('sys')
  method = method || "get"
  
  if(!controller.match(/_controller$/))
    if (controller == 'site') 
        controller = 'Index'
    
    controller = controller + "Controller.coffee";
  
  #sys.puts(sys.inspect(Server.controllers.controller_objects))
  #sys.puts(sys.inspect(controller))
  
  controller_id = util.camelize(controller)
  action_handler = Server.controllers.controller_objects[controller][action]

  # add the handler for the url
  if(url && action_handler)
    app[method](url,action_handler)


module.exports.draw = (app) ->
  match("/")