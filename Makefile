all:
	coffee -jclp src > build/trigger_helper.js && uglifyjs trigger_helper.js -c > build/trigger_helper.min.js