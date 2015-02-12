exec = require('child_process').exec
fs = require 'fs'
build_config = require './build.json'

# 构建供node环境使用的文件,存储在build_config.NodeDir>modelName里,未合并
build_config.Orders.forEach (model)->
  _file_cache = fs.readFileSync("./#{build_config.SourcesDir}/#{model}.coffee")
  _file_requires = build_config.Models[model].requires.map (item)->
    "#{item} = require '../#{item.toLowerCase()}/#{item}.coffee'\n"
  _file_export = "\n\nmodule.exports = #{model}"
  fd = fs.openSync "./api_document/#{model.toLowerCase()}/#{model}.coffee", 'w'
  fs.writeSync(fd, _file_requires.join("") + "\n" + _file_cache.toString() + _file_export)
  fs.closeSync(fd)

# 构建供node环境使用的工程文件
build_Node = ->
  _fd = fs.openSync "./#{build_config.NodeDir}/#{build_config.NodeConcatOutput}.coffee", 'w'
  get_project = ->
    "#{build_config.name} =\n" + build_config.Orders.map((item)->
      "\t#{item}: require './#{item.toLowerCase()}/#{item}.coffee'\n"
    ).join('') + '\n'

  _file_export = "\nmodule.exports = #{build_config.name}"

  fs.writeSync(_fd, get_project() + _file_export)
  fs.closeSync(_fd)

build_Node()


# 构建供浏览器环境使用的工程文件
build_browser = ->
  _fd = fs.openSync "./#{build_config.CoffeeOutFile}.coffee", 'w'
  _file_stream = build_config.Orders.map (item)->
    fs.readFileSync("./#{build_config.SourcesDir}/#{item}.coffee").toString() + "\n"
  _app_name = "@#{build_config.name} =\n" + build_config.Orders.map((item)->
    "\t#{item}: #{item}\n"
  ).join('')
  fs.writeSync _fd, _file_stream.join('') + _app_name
  fs.closeSync _fd

  # 编译刚生成的coffee成js，取同名
  exec("coffee --compile #{build_config.CoffeeOutFile}.coffee")
build_browser()
