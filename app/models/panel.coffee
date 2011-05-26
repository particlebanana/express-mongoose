mongoose = require("mongoose")
sys = require("sys")
schema = new mongoose.Schema({
  title        : {type : String, default: '', required: true}
  time         : {type : String, default : '', required: true}
  date         : {type : Date, default : '', required: true}
  description  : {type : String, default : '', required: true}
});

mongoose.model('Panel', schema)
  