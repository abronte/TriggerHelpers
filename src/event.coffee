# Stubs for forge events.
#
## Not yet implemented:
## forge.events.backPressed.*
class Event
  ADD_LISTENERS = [
    'menuPressed'
    'orientationChange'
    'connectionStateChange'
    'messagePushed'
    'appPaused'
    'appResumed'
  ]

  constructor: ->
    for namespace in ADD_LISTENERS
      @[namespace] =
        addListener: ->

root.event ?= new Event
