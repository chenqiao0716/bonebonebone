class Model
  # 类的属性
  @_defaultValidations:
    'required': (value)->
      return true if typeof value is 'boolean'
      not not value
    'maxlength': (length, value)->
      value.length <= length
    'minlength': (length, value)->
      value.length >= length
    'lengtharea': (min, max, value)->
      min <= value.length <= max
    'number': (value)->
      ///^\d+\.?\d*$///.test value.toString()
    'integer': (value)->
      ///^\d+$///.test value.toString()
    'email': (value)->
      ///^\w[\w\.]+@\w+\.[a-zA-Z]+$///.test value.toString()
    'telphone': (value)->
      ///^1\d{10}$///.test value.toString()
    'regexp': (value, reg_str, flag='')->
      new RegExp(reg_str, flag).test value.toString()

  @_defaultOptions:
    # 规定哪些属性改变时会触发change:attributeName事件
    observers: []
    # 自定义属性的访问方式
    setters: {}
    getters: {}
    # 自定义属性的校验方式
    validates: {}


  # 类的私有方法
  @_validate: (validate_str, value)->
    if ///:///.test validate_str
      validate_key = validate_str.split(':')[0]
      validate_param = validate_str.split(':')[1]
      switch validate_key
        when 'lengtharea'
          _params = validate_param.split('-')
          _result = @_defaultValidations[validate_key](parseInt(_params[0]), parseInt(_params[1]), value)
        when 'regexp'
          _params = validate_param.split(' ')
          _result = @_defaultValidations[validate_key](value, _params[0], _params[1])
        else
          _result = @_defaultValidations[validate_key](value)
    else
      _result = @_defaultValidations[validate_str](value)
    _result


  # 构造函数
  constructor: (obj, options)->
    @_init(obj, options)


  # 实例的public方法
  $parse: (obj, options)->
    obj

  $isNew: ->
    @_data.id is undefined


  # 实例的私有方法
  _validate: (value, validate)->
    return true unless validate
    if typeof validate is 'function'
      return validate(value)
    else
      return @constructor._validate(validate, value)

  _init: (obj, options)->
    options = Util.$extend({}, @constructor._defaultOptions, options)
    # 将原始数据存在_data中
    @_data = @$parse(obj, options)
    @_setProperties(obj, options)
    @_errorObj = {}

  _setProperty: (key, options)->
    Object.defineProperty @, key, {
      enumerable: false
      set: (newValue)->
        _setter = options.setters[key]
        _observed = options.observers.some (item)->
          item is key
        # 校验新值，若果通过校验，则按照setter的方式存入数据，并触发change事件
        # 如果没通过校验，则什么都不做
        if @_validate(newValue, options.validates[key])
          @_data[key] = if _setter? then _setter(newValue) else newValue
          if _observed
            @$fire("change:#{key}", @_data[key])
        else
          @$fire("error:#{key}", newValue) if _observed
        @_data[key]
      get: ->
        _getter = options.getters[key]
        # 如果用户设置有该属性的getter，则按用户的规则返回值，否则返回原数据
        if _getter? then _getter(@_data[key]) else @_data[key]
    }

  _setProperties: (obj, options)->
    for k, v of obj
      @_setProperty(k, options)

Util.$extend(Model.prototype, Event)
