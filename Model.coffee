class Model
  constructor: (obj, options)->
    @_init()
    @_setProperties(obj, options)

  $parse: (obj, options)->
    obj

  _validate: (property, func)->

  _defaultOptions:
    ignores: ['id']
    setters: {}
    getters: {}
    validates: {}

  _init: (obj, options)->
    options = Utils.extend({}, @_defaultOptions, options)
    @_data = @$parse(obj, options)
    @_errorObj = {}

  _setProperties: (obj, options)->
    _setProperty = (key)=>
      Object.defineProperty @, key, {
        set: (newValue)->
          @_data[key] = newValue
          newValue
        get: ->
          @_data[key]
      }
    for k, v of obj
      _setProperty(k)


module.exports = Model