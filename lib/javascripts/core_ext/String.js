(function() {
  var __indexOf = Array.prototype.indexOf || function(item) {
    for (var i = 0, l = this.length; i < l; i++) {
      if (this[i] === item) return i;
    }
    return -1;
  };
  String.prototype.singularize = function() {
    var inflection, newResult, r, result, singular, word, _fn, _i, _j, _len, _len2, _ref, _ref2;
    word = this.toString();
    result = this.toString();
    newResult = false;
    _ref = ActiveSupport.Inflections.uncountable;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      inflection = _ref[_i];
      if (!newResult) {
        r = new RegExp('(' + inflection + ')$', 'i');
        console.log(result, r, result.match(r));
        if (result.match(r)) {
          newResult = result;
        }
      }
    }
    console.log(word, newResult);
    if (newResult) {
      return newResult;
    }
    _ref2 = ActiveSupport.Inflections.singular;
    _fn = function() {
      var regex, replacement;
      if (!newResult) {
        regex = singular[0], replacement = singular[1];
        r = new RegExp(regex, 'ig');
        if (result.match(r)) {
          return newResult = result.replace(r, replacement);
        }
      }
    };
    for (_j = 0, _len2 = _ref2.length; _j < _len2; _j++) {
      singular = _ref2[_j];
      _fn();
    }
    console.log(word, newResult);
    return newResult;
  };
  String.prototype.pluralize = function() {
    var newResult, plural, result, word, _fn, _i, _len, _ref, _ref2;
    word = this.toString();
    result = this.toString();
    if ((word.length === 0) || (_ref = result.toLowerCase(), __indexOf.call(ActiveSupport.Inflections.uncountable, _ref) >= 0)) {
      return result;
    } else {
      newResult = false;
      _ref2 = ActiveSupport.Inflections.plural;
      _fn = function() {
        var r, regex, replacement;
        if (!newResult) {
          regex = plural[0], replacement = plural[1];
          r = new RegExp(regex, 'ig');
          if (result.match(r)) {
            return newResult = result.replace(r, replacement);
          }
        }
      };
      for (_i = 0, _len = _ref2.length; _i < _len; _i++) {
        plural = _ref2[_i];
        _fn();
      }
      return newResult;
    }
  };
  String.prototype.capitalize = function() {
    return this.slice(0, 1).toUpperCase() + this.slice(1);
  };
  String.prototype.titleize = function() {
    var ns, word;
    ns = ((function() {
      var _i, _len, _ref, _results;
      _ref = this.split(/[\s_]/);
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        word = _ref[_i];
        _results.push(word.capitalize());
      }
      return _results;
    }).call(this)).join(' ');
    return ns.replace(/([a-z0-9])(?=[A-Z])/g, '\$1 ');
  };
  String.prototype.camelize = function(lower) {
    var ns;
    ns = this.titleize().replace(/\s/, '').toString();
    if (lower) {
      ns = ns.slice(0, 1).toLowerCase() + ns.slice(1);
    }
    return ns;
  };
  String.prototype.underscore = function() {
    var ns;
    ns = this.replace(/([a-z0-9])(?=[A-Z])/g, '\$1_');
    ns = ns.replace(/([A-Z])([A-Z])(?=[a-z])/g, '\$1_\$2');
    ns = ns.replace(/\s+/, /_/);
    ns = ns.toLowerCase();
    return ns.toString();
  };
  String.prototype.demodulize = function() {
    return this.split('::').slice(-1).toString();
  };
  String.prototype.foreign_key = function(underscore) {
    var u;
    u = "_";
    if (underscore === false) {
      u = "";
    }
    return [this.underscore().demodulize(), 'id'].join(u);
  };
  String.prototype.tableize = function() {
    return this.underscore().pluralize().toString();
  };
  String.prototype.parameterize = function(seperator) {
    if (seperator == null) {
      seperator = '-';
    }
    return this.replace(/[^A-Za-z\s_-]/g, '').replace(/\s+/g, seperator).toLowerCase();
  };
  String.prototype.humanize = function() {
    return this.replace('_id', '').replace('_', ' ').capitalize();
  };
  String.prototype.ord = function() {
    return this.charCodeAt(0);
  };
}).call(this);
