class Request
  isTrigger = false

  constructor: ->
    isTrigger = true if root.forge != undefined

  get: (url, callback) ->
    if isTrigger
      root.forge.request.get(url, callback)
    else
      $.ajax
        type: "GET",
        url: url,
        dataType: "jsonp",
        processData: false
        success: callback

root.request = new Request
