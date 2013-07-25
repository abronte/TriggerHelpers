// Generated by CoffeeScript 1.6.2
(function() {
  var Display, Logger, Notification, Prefs, Request, isTrigger, root, _base, _base1, _nextTick, _ref, _ref1, _ref2, _ref3, _ref4, _ref5, _ref6;

  isTrigger = window.forge !== void 0;

  root = (_ref = (_base = typeof exports !== "undefined" && exports !== null ? exports : window).forge) != null ? _ref : _base.forge = {};

  root.isTrigger = function() {
    return isTrigger;
  };

  _nextTick = function(func) {
    if (func != null) {
      return setTimeout(func, 1);
    }
  };

  Display = (function() {
    var f, _i, _len, _ref1;

    function Display() {}

    _ref1 = ['forceLandscape', 'forcePortrait', 'allowAny'];
    for (_i = 0, _len = _ref1.length; _i < _len; _i++) {
      f = _ref1[_i];
      Display.prototype[f] = function(success, error) {
        return typeof success === "function" ? success() : void 0;
      };
    }

    return Display;

  })();

  if ((_ref1 = root.display) == null) {
    root.display = {};
  }

  if ((_ref2 = (_base1 = root.display).orientation) == null) {
    _base1.orientation = new Display;
  }

  Logger = (function() {
    var LEVELS;

    LEVELS = {
      critical: {
        level: 1,
        methodName: "error"
      },
      error: {
        level: 2
      },
      info: {
        level: 3
      },
      warning: {
        level: 4,
        methodName: "info"
      },
      debug: {
        level: 5
      }
    };

    function Logger() {
      var level, methodName, name, _ref3;

      this.logLevel = 5;
      for (name in LEVELS) {
        _ref3 = LEVELS[name], level = _ref3.level, methodName = _ref3.methodName;
        this[name] = function(msg) {
          if (this.logLevel >= level) {
            return console[methodName != null ? methodName : name]("[" + name.toUpperCase() + "] " + msg);
          }
        };
      }
    }

    Logger.prototype.level = function(level) {
      if (level !== void 0) {
        this.logLevel = level;
      }
      return this.logLevel;
    };

    return Logger;

  })();

  if ((_ref3 = root.logging) == null) {
    root.logging = new Logger;
  }

  Notification = (function() {
    function Notification() {}

    Notification.prototype.alert = function(title, text, success, error) {
      var result;

      if (!((title != null) && (text != null))) {
        console.warn("Title and message text are required!");
      }
      result = confirm("" + title + "\n\n" + text);
      return _nextTick(success);
    };

    Notification.prototype.create = Notification.prototype.alert;

    Notification.prototype.confirm = function(title, body, positive, negative, success, error) {
      var result;

      result = confirm("" + title + "\n\n" + body + "\n\n(" + negative + "/" + positive + ")");
      return _nextTick(function() {
        return typeof success === "function" ? success(result) : void 0;
      });
    };

    /*
    Not implemented:
    notification.setBadgeNumber(number, success, error)
    notification.toast(body, success, error)
    notification.showLoading(title, body, success, error)
    notification.hideLoading(success, error)
    */


    return Notification;

  })();

  if ((_ref4 = root.notification) == null) {
    root.notification = new Notification;
  }

  Prefs = (function() {
    function Prefs() {}

    Prefs.prototype.get = function(key, callback) {
      var _this = this;

      return _nextTick(function() {
        return typeof callback === "function" ? callback(localStorage.getItem(_this._toForgeKey(key))) : void 0;
      });
    };

    Prefs.prototype.set = function(key, val, callback) {
      localStorage.setItem(this._toForgeKey(key), val);
      return _nextTick(callback);
    };

    Prefs.prototype.keys = function(callback) {
      var i, key, keys, _i, _ref5;

      keys = [];
      for (i = _i = 0, _ref5 = localStorage.length - 1; 0 <= _ref5 ? _i <= _ref5 : _i >= _ref5; i = 0 <= _ref5 ? ++_i : --_i) {
        key = localStorage.key(i);
        if (this._isForgeKey(key)) {
          keys.push(this._fromForgeKey(key));
        }
      }
      return _nextTick(function() {
        return callback(keys);
      });
    };

    Prefs.prototype.clear = function(key, callback) {
      localStorage.removeItem(this._toForgeKey(key));
      return _nextTick(callback);
    };

    Prefs.prototype.clearAll = function(callback) {
      var _this = this;

      return forge.prefs.keys(function(keys) {
        var key, _i, _len;

        for (_i = 0, _len = keys.length; _i < _len; _i++) {
          key = keys[_i];
          localStorage.removeItem(_this._toForgeKey(key));
        }
        return _nextTick(callback);
      });
    };

    Prefs.prototype._toForgeKey = function(key) {
      return "forge:" + key;
    };

    Prefs.prototype._fromForgeKey = function(key) {
      return key.replace(/^forge:/, "");
    };

    Prefs.prototype._isForgeKey = function(key) {
      return key.match(/^forge:/);
    };

    return Prefs;

  })();

  if ((_ref5 = root.prefs) == null) {
    root.prefs = new Prefs;
  }

  Request = (function() {
    function Request() {}

    Request.prototype.get = function(url, callback) {
      return $.ajax({
        type: "GET",
        url: url,
        dataType: "jsonp",
        processData: false,
        success: callback
      });
    };

    Request.prototype.ajax = function(params) {
      var oldError,
        _this = this;

      oldError = params.error;
      if (oldError != null) {
        params.error = function(e) {
          return oldError(_this._transformErrorArgument(e));
        };
      }
      return $.ajax(params);
    };

    Request.prototype._transformErrorArgument = function(webError) {
      return {
        message: webError.statusText,
        type: "EXPECTED_FAILURE",
        subtype: null,
        statusCode: "" + webError.status,
        content: webError.responseText
      };
    };

    return Request;

  })();

  if ((_ref6 = root.request) == null) {
    root.request = new Request;
  }

}).call(this);
