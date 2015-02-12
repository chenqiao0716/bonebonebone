exec = require('child_process').exec

exec("coffee --join bone3.js -b --compile src/Util.coffee src/Event.coffee src/Model.coffee src/Collection.coffee", ()->)
