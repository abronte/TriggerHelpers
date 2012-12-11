class Request
  isTrigger = false

  constructor: ->
    isTrigger = true if window.forge != undefined

  get: (url, callback) ->
    if isTrigger
      window.forge.request.get(url, callback)
    else
      $.ajax
        type: "GET",
        url: url,
        dataType: "jsonp",
        processData: false
        success: callback

window.request = new Request
