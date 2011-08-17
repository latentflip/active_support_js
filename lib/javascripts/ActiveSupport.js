(function() {
  this.ActiveSupport = {};
  this.ActiveSupport.Inflections = {
    plural: [['(p)erson$', '\$1eople'], ['(m)an$', '\$1en'], ['(c)hild$', '\$1hildren'], ['(s)ex$', '\$1exes'], ['(m)ove$', '\$1oves'], ['(z)ombie$', '\$1ombies'], ['(p)eople$', '\$1eople'], ['(m)en$', '\$1en'], ['(c)hildren$', '\$1hildren'], ['(s)exes$', '\$1exes'], ['(m)oves$', '\$1oves'], ['(z)ombies$', '\$1ombies'], ['cow$', 'kine'], ['Cow$', 'Kine'], ['kine$', 'kine'], ['Kine$', 'Kine'], ["(quiz)$", '\$1zes'], ["^(oxen)$", '\$1'], ["^(ox)$", '\$1en'], ["([m|l])ice$", '\$1ice'], ["([m|l])ouse$", '\$1ice'], ["(matr|vert|ind)(?:ix|ex)$", '\$1ices'], ["(x|ch|ss|sh)$", '\$1es'], ["([^aeiouy]|qu)y$", '\$1ies'], ["(hive)$", '\$1s'], ["(?:([^f])fe|([lr])f)$", '\$1\$2ves'], ["sis$", 'ses'], ["([ti])a$", '\$1a'], ["([ti])um$", '\$1a'], ["(buffal|tomat)o$", '\$1oes'], ["(bu)s$", '\$1ses'], ["(alias|status)$", '\$1es'], ["(octop|vir)i$", '\$1i'], ["(octop|vir)us$", '\$1i'], ["(ax|test)is$", '\$1es'], ["s$", 's'], ["$", 's']],
    singular: [['(p)eople$', '\$1erson'], ['(m)en$', '\$1an'], ['(c)hildren$', '\$1hild'], ['(s)exes$', '\$1ex'], ['(m)oves$', '\$1ove'], ['(z)ombies$', '\$1ombie'], ['kine$', 'cow'], ['Kine$', 'Cow'], ["(database)s$", '\$1'], ["(quiz)zes$", '\$1'], ["(matr)ices$", '\$1ix'], ["(vert|ind)ices$", '\$1ex'], ["^(ox)en", '\$1'], ["(alias|status)es$", '\$1'], ["(octop|vir)i$", '\$1us'], ["(cris|ax|test)es$", '\$1is'], ["(shoe)s$", '\$1'], ["(o)es$", '\$1'], ["(bus)es$", '\$1'], ["([m|l])ice$", '\$1ouse'], ["(x|ch|ss|sh)es$", '\$1'], ["(m)ovies$", '\$1ovie'], ["(s)eries$", '\$1eries'], ["([^aeiouy]|qu)ies$", '\$1y'], ["([lr])ves$", '\$1f'], ["(tive)s$", '\$1'], ["(hive)s$", '\$1'], ["([^f])ves$", '\$1fe'], ["(^analy)ses$", '\$1sis'], ["((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$", '\$1\$2sis'], ["([ti])a$", '\$1um'], ["(n)ews$", '\$1ews'], ["s$", '']],
    irregular: [['person', 'people'], ['man', 'men'], ['child', 'children'], ['sex', 'sexes'], ['move', 'moves'], ['cow', 'kine'], ['zombie', 'zombies']],
    uncountable: ['equipment', 'information', 'rice', 'money', 'species', 'series', 'fish', 'sheep', 'jeans']
  };
  this.ActiveSupport.Date = {
    dayNames: ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday'],
    monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
    monthDays: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  };
  this.ActiveSupport.zeroPad = function(number, width) {
    width = width - number.toString().length;
    if (width > 0) {
      return new Array(width + 1).join('0') + number;
    } else {
      return number.toString();
    }
  };
}).call(this);
