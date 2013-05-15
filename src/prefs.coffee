class Prefs
  get: (key, callback) ->
    _nextTick =>
      callback? localStorage.getItem @_toForgeKey(key)

  set: (key, val, callback) ->
    localStorage.setItem @_toForgeKey(key), val
    _nextTick callback

  keys: (callback) ->
    keys = []
    for i in [0..localStorage.length-1]
      key = localStorage.key(i)
      keys.push(@_fromForgeKey key) if @_isForgeKey key
    _nextTick ->
      callback keys

  clear: (key, callback) ->
    localStorage.removeItem @_toForgeKey key
    _nextTick callback

  clearAll: (callback) ->
    forge.prefs.keys (keys) =>
      for key in keys
        # Could use forge.prefs.clear, but async, meh
        localStorage.removeItem @_toForgeKey key
      _nextTick callback

  _toForgeKey: (key) -> "forge:#{key}"
  _fromForgeKey: (key) -> key.replace /^forge:/, ""
  _isForgeKey: (key) -> key.match /^forge:/

root.prefs ?= new Prefs
