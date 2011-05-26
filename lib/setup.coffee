module.exports.setup = (o) ->
  sys = require("sys")
  app = o.app
  mongoose = o.mongoose
  io = o.io
  stylus = o.stylus
  messages = o.messages
  nib = require 'nib'
  express = o.express
  
  Server.paths = o.paths
  
  global.db = mongoose.connect("mongodb://localhost/conference")
  
  compile = (str) ->
    return stylus(str)
      .set('compress', true)
      .use(nib());
  
  app.configure(() ->
    app.set 'view engine', 'jade'
    app.set 'views', o.paths.views
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use app.router
    app.use express.static(o.paths.root)
    app.use express.cookieParser()
    app.use express.session({ secret: 'keyboard cat' })
    
    app.use stylus.middleware({
      debug: true
      src: o.paths.app
      dest: o.paths.root
      compile: compile
    })
  )
  
  app.configure 'development', () ->
    app.use express.errorHandler({ 
      dumpExceptions: true
      howStack: true 
    })
    
  # Flash message helper provided by express-messages
  app.dynamicHelpers({
    messages: messages
    base: () ->
      return '/' == app.route ? '' : app.route
  });

  require("./models").autoload db
  require("./controllers").autoload app
  require("./routes").draw app
  
  app.listen(o.port || 3000)
    
  