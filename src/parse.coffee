class Parse
  installationInfo: (success) ->
    nextTick ->
      success id: 'dev-browser'

  push:
    subscribe: (channel, success) ->
      subscriptions = @_channels()
      subscriptions.push channel unless channel in subscriptions
      @_setChannels subscriptions
      nextTick success
    unsubscribe: (channel, success) ->
      subscriptions = @_channels()
      i = subscriptions.indexOf channel
      # A silly way to delete an element
      subscriptions = subscriptions[0...i].concat subscriptions[i+1..]
      @_setChannels subscriptions
      nextTick success
    subscribedChannels: (success) ->
      nextTick =>
        success @_channels()
    _channels: ->
      JSON.parse localStorage.getItem('forge-helper:subscriptions') ? "[]"
    _setChannels: (channels) ->
      localStorage.setItem 'forge-helper:subscriptions', JSON.stringify channels

root.parse ?= new Parse
