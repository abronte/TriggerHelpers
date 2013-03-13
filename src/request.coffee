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

  post: (url, body, callback) ->
    if isTrigger
      root.forge.request.ajax
        type: "POST",
        url: url,
        data: body,
        success: callback
    else
      $.ajax
        type: "POST",
        url: url,
        data: body
        dataType: "jsonp",
        processData: false
        success: callback

  ajax: (params) ->
    if isTrigger
      root.forge.request.ajax params
    else
      $.ajax params


root.request = new Request
