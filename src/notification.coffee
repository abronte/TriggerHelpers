class Notification
  alert: (title, text, success, error) ->
    console.warn "Title and message text are required!" unless title? and text?
    result = confirm "#{title}\n\n#{text}"
    _nextTick success

  create: @::alert

  confirm: (title, body, positive, negative, success, error) ->
    result = confirm "#{title}\n\n#{body}\n\n(#{negative}/#{positive})"
    _nextTick -> success?(result)

  toast: (body, success, error) ->
    style = {
      position: "absolute"
      top: "10%"
      'z-index': 99
      width: "33%"
      'margin-left': "33%"
      'text-align': "center"
      background: "#666"
      color: "#FFF"
      padding: "1em 0.4em"
      'border-radius': "4px"
    }
    toast = $("<div>#{body}</div>").css(style)
    $("body").prepend toast
    toast.fadeIn(200).delay(1000).fadeOut 1000, ->
      toast.remove()
    _nextTick success

  ###
  Not implemented:
  notification.setBadgeNumber(number, success, error)
  notification.showLoading(title, body, success, error)
  notification.hideLoading(success, error)
  ###

root.notification ?= new Notification
