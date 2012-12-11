all:
	./node_modules/coffee-script/bin/coffee -jclp src > ./build/trigger_helper.js && ./node_modules/uglify-js/bin/uglifyjs trigger_helper.js -c > ./build/trigger_helper.min.js