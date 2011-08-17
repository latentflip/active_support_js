(function() {
  var ActiveSupport;
  ActiveSupport = {};
  ActiveSupport.zeroPad = function(number, width) {
    width = width - number.toString().length;
    if (width > 0) {
      return new Array(width + 1).join('0') + number;
    } else {
      return number;
    }
  };
  Date.prototype.monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
  Date.prototype.monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  Date.prototype.daysInMonth = function() {
    return this.monthDays[this.getMonth()];
  };
  Date.prototype.monthName = function() {
    return this.monthNames[this.getMonth()];
  };
  Date.prototype.shortMonthName = function() {
    return this.monthName().slice(0, 3);
  };
  Date.prototype.to_s = function(opt) {
    switch (opt) {
      case 'short':
        return "" + (this.getDate()) + " " + (this.shortMonthName());
        break;
      case 'long':
        return "" + (this.monthName()) + " " + (this.getDate()) + ", " + (this.getFullYear());
        break;
      case 'long_ordinal':
      case 'longOrdinal':
        return "" + (this.monthName()) + " " + (this.getDate().ordinalize()) + ", " + (this.getFullYear());
        break;
      case 'rfc822':
        return "" + (this.getDate()) + " " + (this.shortMonthName()) + " " + (this.getFullYear());
        break;
      case void 0:
      case 'db':
        return "" + (this.getFullYear()) + "-" + (ActiveSupport.zeroPad(this.getMonth() + 1, 2)) + "-" + (this.getDate());
    }
  };
  Date.prototype.change = function(opts) {
    var d;
    d = this;
    if ((opts.day != null) && (opts.month != null)) {
      d = new Date(d.setDate(1));
    }
    if (opts.year != null) {
      d = new Date(d.setFullYear(opts.year));
    }
    if (opts.month != null) {
      d = new Date(d.setMonth(opts.month));
    }
    if (opts.day != null) {
      if (opts.day > this.daysInMonth()) {
        throw "Invalid Date";
      } else if (opts.day < 0) {
        d = this.daysInMonth() + 1 + d;
      }
      d = new Date(d.setDate(opts.day));
    }
    return d;
  };
  Date.prototype.beginning_of_week = function() {
    var d;
    d = this.getDay();
    if (d === 0) {
      d = 6;
    } else {
      d = d - 1;
    }
    return new Date(this.getTime() - d * 24 * 3600 * 1000);
  };
  Date.prototype.end_of_week = function() {
    var d;
    d = this.getDay();
    if (d === 0) {
      d = 0;
    } else {
      d = 7 - d;
    }
    return new Date(this.getTime() + d * 24 * 3600 * 1000);
  };
  Date.prototype.beginning_of_month = function() {
    return new Date(this.setDate(1));
  };
  Date.prototype.beginning_of_quarter = function() {
    var m, new_m;
    m = this.getMonth();
    if (m >= 9) {
      new_m = 9;
    }
    if (m >= 6) {
      if (new_m == null) {
        new_m = 6;
      }
    }
    if (m >= 3) {
      if (new_m == null) {
        new_m = 3;
      }
    }
    if (m >= 0) {
      if (new_m == null) {
        new_m = 0;
      }
    }
    return this.change({
      day: 1,
      month: new_m
    });
  };
  Date.prototype.end_of_month = function() {
    return new Date(this.setDate(this.daysInMonth()));
  };
  Date.prototype.end_of_quarter = function() {
    var m, new_m;
    m = this.getMonth();
    if (m >= 9) {
      new_m = 11;
    }
    if (m >= 6) {
      if (new_m == null) {
        new_m = 8;
      }
    }
    if (m >= 3) {
      if (new_m == null) {
        new_m = 5;
      }
    }
    if (m >= 0) {
      if (new_m == null) {
        new_m = 2;
      }
    }
    return this.change({
      day: -1,
      month: new_m
    });
  };
}).call(this);
