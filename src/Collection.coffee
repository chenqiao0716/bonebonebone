Util = require './Util.coffee'
Event = require './Event.coffee'
Model = require './Model.coffee'

###
* a = [{name: 'hehe', id: 2}, {name: 'heihei', id: 1}]
*
* =====>>>>
*
* {
*   length: 2
*   $models: a.map (item)-> new Model(item, options)
*   $reset: ->
*   $add: ->
*   ...
* }
*
###
class Collection
  model: Model

  constructor: (sets, options)->
    @_init sets, options
    @$init sets, options

  $init: ->

  $add: (model)->
    if model instanceof @model
      @$models.push model
    else
      @_createModel model
    @$fire 'add', {@$models[@$models.length-1]}

  $reset: (sets)->
    @_setModels sets
    @$fire 'reset'

  _init: (sets, options)->
    @_options = options
    @_setModels sets
    @_setProperties()

  _setProperties: ->
    # 添加length属性
    Object.defineProperty @, 'length', {
      enumerable: false
      get: ->
        @$models.length
      set: (newValue)->
        @$models.length
    }

  _createModel: (model)->
    _newmodel = new @model model, @_options
    @$models.push _newmodel

  _setModels: (sets)->
    @$models = []
    for model in sets
      @_createModel model

Util.$extend Collection.prototype, Event

module.exports = Collection