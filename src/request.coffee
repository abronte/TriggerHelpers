class Request
  get: (url, callback) ->
    $.ajax
      type: "GET",
      url: url,
      dataType: "jsonp",
      processData: false
      success: callback

  ajax: (params) ->
    oldError = params.error
    if oldError?
      params.error = (e) =>
        oldError @_transformErrorArgument e
    $.ajax params

  # Transforms the browser error object into something that looks more like
  # the error objects Forge uses.
  _transformErrorArgument: (webError) ->
    {
      message: webError.statusText
      type: "EXPECTED_FAILURE" # I do not know what would count as an unexpected failure
      subtype: null
      statusCode: "#{webError.status}"
      content: webError.responseText
    }


root.request ?= new Request
