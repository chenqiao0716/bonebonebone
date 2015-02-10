Utils = require './Util.coffee'

Events =
  $on: (target, eventType, handle)->
    target._listeners ?= {}
    _handles = target._listeners[eventType]
    if _handles? and _handles.length > 0
      # 如果此前已有绑定过别的事件
      for _handle in _handles
        # 如果此前绑定过该函数，则立刻结束该函数
        if handle is _handle
          return true
      _handles.push handle
    else
      # 如果此前未绑定过任何事件，则直接添加事件绑定
      target._listeners[eventType] = [handle]

  $fire: (eventType, msg)->
    _handles = @_listeners[eventType]
    # 如果不存在绑定的函数，则直接返回错误
    return false unless _handles?
    for _handle in _handles
      _handle(msg)
    return true

  $off: (eventType, handle)->
    if eventType is undefined
      @_listeners = {}
    else
      if handle is undefined
        delete @_listeners[eventType]
      else
        @_listeners[eventType] = @_listeners[eventType].filter (_handle)->
          _handle isnt handle

module.exports = Events