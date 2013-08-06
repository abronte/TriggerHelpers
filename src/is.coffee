class Platform
  mobile: ->
    false

  web: ->
    true

  android: ->
    false

  ios: ->
    false

  orientation:
    portrait: ->
      true

    landscape: ->
      false

  connection:
    connected: ->
      true

    wifi: ->
      true


root.is ?= new Platform
