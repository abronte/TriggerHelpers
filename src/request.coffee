class Request
  get: (url, callback) ->
    $.ajax
      type: "GET",
      url: url,
      dataType: "jsonp",
      processData: false
      success: callback

  ajax: (params) ->
    $.ajax params


root.request ?= new Request
