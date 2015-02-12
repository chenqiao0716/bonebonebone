Util =
  $extend: (target, sources...)->
    if Object.assign
      return Object.assign.apply(Object, arguments)
    else
      if target?
        to = Object(target)
        for source in sources
          if source?
            for key, value of source
              desc = Object.getOwnPropertyDescriptor(source, key)
              to[key] = source[key] if desc? and desc.enumerable
        return to
      else
        throw new TypeError('Cannot convert first argument to object')

  $idGenerator: (prefix='', suffix='')->
    _id = Utils._idGenerator()
    "#{prefix}#{_id}#{suffix}"

  _idGenerator: (->
    inner_id = 0
    add = ->
      inner_id += 1
    return add
  )()
