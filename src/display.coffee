# This class is purely stubs, since the browser has no orientation.
class Display
  for f in ['forceLandscape', 'forcePortrait', 'allowAny']
    @::[f] = (success, error) ->
      success?()

# According to the Trigger docs, this should be available at `forge.display`.
# However, empirical study suggests it is *actually* at `forge.display.orientation`.
root.display ?= {}
root.display.orientation ?= new Display
