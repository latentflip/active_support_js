(function() {
  Number.prototype.ordinalize = function() {
    var last, next_last, s;
    s = this.toString();
    last = s[s.length - 1];
    next_last = s[s.length - 2];
    switch (last) {
      case "1":
        if (next_last === '1') {
          return s + "th";
        } else {
          return s + "st";
        }
        break;
      case "2":
        if (next_last === '1') {
          return s + "th";
        } else {
          return s + "nd";
        }
        break;
      case "3":
        if (next_last === '1') {
          return s + "th";
        } else {
          return s + "rd";
        }
        break;
      default:
        return s + "th";
    }
  };
}).call(this);
