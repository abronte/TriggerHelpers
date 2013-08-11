# Stubs for forge events.
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

  backPressed:
    addListener: ->
    preventDefault: (success, error) ->
      success?()

root.event ?= new Event
