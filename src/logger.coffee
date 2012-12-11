class Logger
  isTrigger = false
  logLevel = 5
  enabled = true

  log = (msg, level) ->
    if enabled
      if isTrigger
        window.forge.logging.log msg, eval("forge.logging."+level.toUpperCase())
      else
        console.log "["+level.toUpperCase()+"] "+msg

  constructor: ->
    if window.forge != undefined
      isTrigger = true

      window.onerror = (e, u, l) ->
        log(e + " on line "+l, "error")

  enabled: (set) ->
    enabled = set if set != undefined
    enabled

  level: (level) ->
    logLevel = level if level != undefined
    logLevel

  # level 1
  critical: (msg) ->
    log(msg, "critical") if logLevel >= 1

  # level 2
  error: (msg) ->
    log(msg, "error") if logLevel >= 2

  # level 3
  info: (msg) ->
    log(msg, "info") if logLevel >= 3

  # level 4
  warning: (msg) ->
    log(msg, "warning") if logLevel >= 4

  # level 5
  debug: (msg) ->
    log(msg, "debug") if logLevel >= 5

window.log = new Logger
