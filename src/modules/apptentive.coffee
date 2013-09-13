class Apptentive
  setApiKey: (key) ->
  setAppID: (username) ->
  setInitialUserName: (username) ->
  setInitialUserEmailAddress: (email) ->
  addCustomData: (data, key) ->
  removeCustomData: (key) ->
  showRatingFlowIfConditionsAreMet: ->
  logSignificantEvent: ->
  presentMessageCenter: ->
    forge.logging.debug "Apptentive message center opened"
  unreadMessageCount: (cb) ->
    nextTick -> cb 0
  unreadMessageCountChanged:
    addListener: (cb) ->
  hasSurveyAvailableWithNoTags: (cb) ->
    nextTick -> cb false
  hasSurveyAvailableWithTags: (cb) ->
    nextTick -> cb false
  surveyBecameAvailable:
    addListener: (cb) ->
  presentSurveyControllerWithNoTags: ->
    forge.logging.debug "Apptentive survey presented (no tags)"
  presentSurveyControllerWithTags: (tags) ->
    forge.logging.debug "Apptentive survey presented (tags: #{tags})"
  surveyWasSent:
    addListener: (cb) ->

root.apptentive ?= new Apptentive
