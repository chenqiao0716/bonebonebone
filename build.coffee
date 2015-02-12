exec = require('child_process').exec
fs = require 'fs'
build_config = require './build.json'


build_config.Orders.forEach (model)->
  _file_cache = fs.readFileSync("./#{build_config.SourcesDir}/#{model}.coffee")
  _file_requires = build_config.Models[model].requires.map (item)->
    "#{item} = require '../#{item.toLowerCase()}/#{item}.coffee'\n"
  _file_export = "\n\nmodule.exports = #{model}"
  fd = fs.openSync "./api_document/#{model.toLowerCase()}/#{model}.coffee", 'w'
  fs.writeSync(fd, _file_requires.join("") + "\n" + _file_cache.toString() + _file_export)
  fs.closeSync(fd)

# fs.open 'haha.coffee', 'w', (error, fd)->
#   fs.writeFileSync('haha.coffee', 'nimei')
#   fs.closeSync(fd)

# if fs.existsSync './haha.coffee'
#   console.log fs.readFileSync('./haha.coffee')
# else
#   exec 'touch haha.coffee', (a)->
#     console.log a

# a = fs.readFileSync('./Bonebonebone.coffee') + '\n' + fs.readFileSync('./test.coffee')

# exec("coffee --join bone3.js -b --compile src/Util.coffee src/Event.coffee src/Model.coffee src/Collection.coffee", ()->)
