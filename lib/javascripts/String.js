(function() {
  var __indexOf = Array.prototype.indexOf || function(item) {
    for (var i = 0, l = this.length; i < l; i++) {
      if (this[i] === item) return i;
    }
    return -1;
  };
  this.ActiveSupport = this.ActiveSupport || {};
  ActiveSupport.Inflections = {
    plural: [['(p)erson$', '\$1eople'], ['(m)an$', '\$1en'], ['(c)hild$', '\$1hildren'], ['(s)ex$', '\$1exes'], ['(m)ove$', '\$1oves'], ['(z)ombie$', '\$1ombies'], ['(p)eople$', '\$1eople'], ['(m)en$', '\$1en'], ['(c)hildren$', '\$1hildren'], ['(s)exes$', '\$1exes'], ['(m)oves$', '\$1oves'], ['(z)ombies$', '\$1ombies'], ['cow$', 'kine'], ['Cow$', 'Kine'], ['kine$', 'kine'], ['Kine$', 'Kine'], ["(quiz)$", '\$1zes'], ["^(oxen)$", '\$1'], ["^(ox)$", '\$1en'], ["([m|l])ice$", '\$1ice'], ["([m|l])ouse$", '\$1ice'], ["(matr|vert|ind)(?:ix|ex)$", '\$1ices'], ["(x|ch|ss|sh)$", '\$1es'], ["([^aeiouy]|qu)y$", '\$1ies'], ["(hive)$", '\$1s'], ["(?:([^f])fe|([lr])f)$", '\$1\$2ves'], ["sis$", 'ses'], ["([ti])a$", '\$1a'], ["([ti])um$", '\$1a'], ["(buffal|tomat)o$", '\$1oes'], ["(bu)s$", '\$1ses'], ["(alias|status)$", '\$1es'], ["(octop|vir)i$", '\$1i'], ["(octop|vir)us$", '\$1i'], ["(ax|test)is$", '\$1es'], ["s$", 's'], ["$", 's']],
    singular: [['(p)eople$', '\$1erson'], ['(m)en$', '\$1an'], ['(c)hildren$', '\$1hild'], ['(s)exes$', '\$1ex'], ['(m)oves$', '\$1ove'], ['(z)ombies$', '\$1ombie'], ['kine$', 'cow'], ['Kine$', 'Cow'], ["(database)s$", '\$1'], ["(quiz)zes$", '\$1'], ["(matr)ices$", '\$1ix'], ["(vert|ind)ices$", '\$1ex'], ["^(ox)en", '\$1'], ["(alias|status)es$", '\$1'], ["(octop|vir)i$", '\$1us'], ["(cris|ax|test)es$", '\$1is'], ["(shoe)s$", '\$1'], ["(o)es$", '\$1'], ["(bus)es$", '\$1'], ["([m|l])ice$", '\$1ouse'], ["(x|ch|ss|sh)es$", '\$1'], ["(m)ovies$", '\$1ovie'], ["(s)eries$", '\$1eries'], ["([^aeiouy]|qu)ies$", '\$1y'], ["([lr])ves$", '\$1f'], ["(tive)s$", '\$1'], ["(hive)s$", '\$1'], ["([^f])ves$", '\$1fe'], ["(^analy)ses$", '\$1sis'], ["((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$", '\$1\$2sis'], ["([ti])a$", '\$1um'], ["(n)ews$", '\$1ews'], ["s$", '']],
    irregular: [['person', 'people'], ['man', 'men'], ['child', 'children'], ['sex', 'sexes'], ['move', 'moves'], ['cow', 'kine'], ['zombie', 'zombies']],
    uncountable: ['equipment', 'information', 'rice', 'money', 'species', 'series', 'fish', 'sheep', 'jeans']
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