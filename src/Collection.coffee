class Collection
  model: Model

  constructor: (sets, options)->
    @_init sets, options

  $add: (model)->
    if model instanceof @model
      @$models.push model
      _result = model
    else
      _result = @_createModel model
    @$fire 'add', _result
    _result

  $reset: (sets)->
    @_setModels sets
    @$fire 'reset'
    @

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
    _newmodel

  _setModels: (sets)->
    @$models = []
    for model in sets
      @_createModel model

Util.$extend Collection.prototype, Event
