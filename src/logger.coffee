class Logger
  LEVELS =
    critical:
      level: 1
      methodName: "error"
    error:
      level: 2
    info:
      level: 3
    warning:
      level: 4
      methodName: "info"
    debug:
      level: 5

  constructor: ->
    @logLevel = 5
    for name, {level, methodName} of LEVELS
      @[name] = (msg) ->
        if @logLevel >= level
          console[methodName ? name](msg)

  level: (level) ->
    @logLevel = level if level != undefined
    @logLevel

root.logging ?= new Logger
