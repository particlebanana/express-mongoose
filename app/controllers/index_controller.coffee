actions = {}
mongoose = require("mongoose")
panel = mongoose.model('Panel')

actions.index = (req, res) ->
  panel.find((err, docs) ->
    res.render('index', {
      panels :  docs
      total : docs.length
    })
  )

module.exports = actions