Events =
  $on: (target, eventType, handle)->

  $fire: (eventType, msg)->

  $off: (eventType, handle)->

module.exports = Events