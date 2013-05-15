_nextTick = (func) ->
  setTimeout func, 1 if func?
