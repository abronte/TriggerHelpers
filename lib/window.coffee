isTrigger = (window.forge isnt undefined)

root = (exports ? window).forge ?= {}

root.isTrigger = -> isTrigger
