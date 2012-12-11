all:
	cat ./lib/window.coffee ./src/*.coffee | ./node_modules/coffee-script/bin/coffee -sc > ./build/trigger_helper.js && \
	./node_modules/uglify-js/bin/uglifyjs ./build/trigger_helper.js -c > ./build/trigger_helper.min.js