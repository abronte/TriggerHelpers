(function() {
  var Logger, Request;

  window.isTrigger = function() {
    return window.forge !== void 0;
  };

  Logger = (function() {
    var enabled, isTrigger, log, logLevel;

    isTrigger = false;

    logLevel = 5;

    enabled = true;

    log = function(msg, level) {
      if (enabled) {
        if (isTrigger) {
          return window.forge.logging.log(msg, eval("forge.logging." + level.toUpperCase()));
        } else {
          return console.log("[" + level.toUpperCase() + "] " + msg);
        }
      }
    };

    function Logger() {
      if (window.forge !== void 0) {
        isTrigger = true;
        window.onerror = function(e, u, l) {
          return log(e + " on line " + l, "error");
        };
      }
    }

    Logger.prototype.enabled = function(set) {
      if (set !== void 0) {
        enabled = set;
      }
      return enabled;
    };

    Logger.prototype.level = function(level) {
      if (level !== void 0) {
        logLevel = level;
      }
      return logLevel;
    };

    Logger.prototype.critical = function(msg) {
      if (logLevel >= 1) {
        return log(msg, "critical");
      }
    };

    Logger.prototype.error = function(msg) {
      if (logLevel >= 2) {
        return log(msg, "error");
      }
    };

    Logger.prototype.info = function(msg) {
      if (logLevel >= 3) {
        return log(msg, "info");
      }
    };

    Logger.prototype.warning = function(msg) {
      if (logLevel >= 4) {
        return log(msg, "warning");
      }
    };

    Logger.prototype.debug = function(msg) {
      if (logLevel >= 5) {
        return log(msg, "debug");
      }
    };

    return Logger;

  })();

  window.log = new Logger;

  Request = (function() {
    var isTrigger;

    isTrigger = false;

    function Request() {
      if (window.forge !== void 0) {
        isTrigger = true;
      }
    }

    Request.prototype.get = function(url, callback) {
      if (isTrigger) {
        return window.forge.request.get(url, callback);
      } else {
        return $.ajax({
          type: "GET",
          url: url,
          dataType: "jsonp",
          processData: false,
          success: callback
        });
      }
    };

    return Request;

  })();

  window.request = new Request;

}).call(this);
