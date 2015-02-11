Model = require './Util.coffee'
Model = require './Event.coffee'
Model = require './Model.coffee'


class Collection
  model: Model

  constructor: (sets, options)->
    @_init(sets, options)
    @$init(sets, options)

  $init: ->

  _init: (sets, options)->
    @_setModels(sets, options)

  _createModel: (model, options)->
    _newmodel = new @model(model, options)

  _setModels: (sets, options)->
    @$models = []
    for model in sets
      @_createModel(model, options)

module.exports = Collection