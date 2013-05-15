class Notification
  alert: (title, text, success, error) ->
    console.warn "Title and message text are required!" unless title? and text?
    result = confirm "#{title}\n\n#{text}"
    setTimeout(success, 1) if success?

  create: @::alert

  confirm: (title, body, positive, negative, success, error) ->
    result = confirm "#{title}\n\n#{body}\n\n(#{negative}/#{positive})"
    setTimeout (-> success(result)), 1 if success?

  ###
  Not implemented:
  notification.setBadgeNumber(number, success, error)
  notification.toast(body, success, error)
  notification.showLoading(title, body, success, error)
  notification.hideLoading(success, error)
  ###

root.notification ?= new Notification
