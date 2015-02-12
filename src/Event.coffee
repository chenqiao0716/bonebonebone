Event =
  $on: (eventType, handle, context)->
    @_listeners ?= {}
    context ?= @
    _handles = @_listeners[eventType]

    if _handles? and _handles.length > 0
      # 如果此前已有绑定过别的事件
      for _handle in _handles
        # 如果此前绑定过该函数，则立刻结束该函数
        if handle is _handle.func
          return true
      _handles.push
        func: handle
        ctx: context
    else
      # 如果此前未绑定过任何事件，则直接添加事件绑定
      @_listeners[eventType] = [{
        func: handle
        ctx: context
      }]

  $fire: (eventType, msg)->
    _handles = if @_listeners? then @_listeners[eventType] else null
    # 如果不存在绑定的函数，则直接返回错误
    return false unless _handles?
    for _handle in _handles
      _handle.func.call(_handle.ctx, msg)
    return true

  $off: (eventType, handle)->
    if eventType is undefined
      @_listeners = {}
    else
      if handle is undefined
        delete @_listeners[eventType]
      else
        @_listeners[eventType] = @_listeners[eventType].filter (_handle)->
          _handle.func isnt handle
