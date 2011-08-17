(function() {
  Date.prototype.isLeapYear = function() {
    var y;
    y = this.getFullYear();
    if ((y % 400) === 0) {
      return true;
    }
    if ((y % 100) === 0) {
      return false;
    }
    if ((y % 4) === 0) {
      return true;
    }
    return false;
  };
  Date.prototype.daysInMonth = function() {
    var d, m;
    m = this.getMonth();
    d = ActiveSupport.Date.monthDays[m];
    if (m === 1 && this.isLeapYear()) {
      return d + 1;
    } else {
      return d;
    }
  };
  Date.prototype.monthName = function() {
    return ActiveSupport.Date.monthNames[this.getMonth()];
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
    var d, day;
    d = this;
    day = opts.day || d.getDate();
    d = new Date(d.setDate(1));
    if (opts.year != null) {
      d = new Date(d.setFullYear(opts.year));
    }
    if (opts.month != null) {
      d = new Date(d.setMonth(opts.month));
    }
    if (day > d.daysInMonth()) {
      throw "Invalid Date";
    } else if (opts.day < 0) {
      day = d.daysInMonth() + 1 + day;
    }
    d = new Date(d.setDate(day));
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
    return this.addDays(-1 * d);
  };
  Date.prototype.end_of_week = function() {
    var d;
    d = this.getDay();
    if (d === 0) {
      d = 0;
    } else {
      d = 7 - d;
    }
    return this.addDays(d);
  };
  Date.prototype.beginning_of_month = function() {
    return new Date(this.setDate(1));
  };
  Date.prototype.end_of_month = function() {
    return new Date(this.setDate(this.daysInMonth()));
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
  Date.prototype.beginning_of_year = function() {
    return this.change({
      month: 0,
      day: 1
    });
  };
  Date.prototype.end_of_year = function() {
    return this.change({
      month: 11,
      day: 31
    });
  };
  Date.prototype.addMonths = function(n) {
    var date, day;
    day = this.getDate();
    date = this.change({
      day: 1
    });
    date = date.change({
      month: date.getMonth() + n
    });
    if (day > date.daysInMonth()) {
      day = date.daysInMonth();
    }
    date = date.change({
      day: day
    });
    return date;
  };
  Date.prototype.addDays = function(n) {
    return new Date(this.getTime() + n * 24 * 3600 * 1000);
  };
  Date.prototype.advance = function(opts) {
    var d;
    d = this;
    if (opts.years != null) {
      d = d.addMonths(12 * opts.years);
    }
    if (opts.months != null) {
      d = d.addMonths(opts.months);
    }
    if (opts.weeks != null) {
      d = d.addDays(7 * opts.weeks);
    }
    if (opts.days != null) {
      d = d.addDays(opts.days);
    }
    return d;
  };
  Date.prototype.days_ago = function(n) {
    return new Date(this.getTime() - n * 24 * 3600 * 1000);
  };
  Date.prototype.days_since = function(n) {
    return new Date(this.getTime() + n * 24 * 3600 * 1000);
  };
  Date.prototype.weeks_ago = function(n) {
    return new Date(this.getTime() - n * 7 * 24 * 3600 * 1000);
  };
  Date.prototype.weeks_since = function(n) {
    return new Date(this.getTime() + n * 7 * 24 * 3600 * 1000);
  };
  Date.prototype.change_week_day = function(newDay) {
    var d;
    d = this.beginning_of_week();
    d = d.addDays(ActiveSupport.Date.dayNames.indexOf(newDay));
    return d;
  };
  Date.prototype.next_week = function(newDay) {
    if (newDay == null) {
      newDay = 'monday';
    }
    return this.weeks_since(1).change_week_day(newDay);
  };
  Date.prototype.prev_week = function(newDay) {
    if (newDay == null) {
      newDay = 'monday';
    }
    return this.weeks_ago(1).change_week_day(newDay);
  };
  Date.prototype.months_ago = function(n) {
    return this.advance({
      months: -1 * n
    });
  };
  Date.prototype.months_since = function(n) {
    return this.advance({
      months: n
    });
  };
  Date.prototype.years_ago = function(n) {
    return this.advance({
      years: -1 * n
    });
  };
  Date.prototype.years_since = function(n) {
    return this.advance({
      years: n
    });
  };
  Date.prototype.prev_year = function() {
    return this.years_ago(1);
  };
  Date.prototype.next_year = function() {
    return this.years_since(1);
  };
  Date.prototype.next_month = function() {
    return this.months_since(1);
  };
  Date.prototype.prev_month = function() {
    return this.months_ago(1);
  };
  Date.prototype.yesterday = function() {
    return this.days_ago(1);
  };
  Date.prototype.tomorrow = function() {
    return this.days_since(1);
  };
  Date.current = function() {
    return Date.today();
  };
  Date.today = function() {
    return new Date();
  };
  Date.yesterday = function() {
    return new Date().yesterday();
  };
  Date.tomorrow = function() {
    console.log('t', new Date());
    console.log('t', new Date().tomorrow());
    return new Date().tomorrow();
  };
  Date.prototype.isPast = function() {
    var d, dc, m, mc, today, y, yc, _ref, _ref2, _ref3;
    today = Date.current();
    _ref = [this.getDate(), today.getDate()], d = _ref[0], dc = _ref[1];
    _ref2 = [this.getMonth(), today.getMonth()], m = _ref2[0], mc = _ref2[1];
    _ref3 = [this.getFullYear(), today.getFullYear()], y = _ref3[0], yc = _ref3[1];
    return (y < yc) || (y === yc && m < mc) || (y === yc && m === mc && d < dc);
  };
  Date.prototype.isToday = function() {
    var d, m, today, y;
    today = Date.current();
    d = this.getDate() === today.getDate();
    m = this.getMonth() === today.getMonth();
    y = this.getFullYear() === today.getFullYear();
    return d && m && y;
  };
  Date.prototype.isFuture = function() {
    var d, dc, m, mc, today, y, yc, _ref, _ref2, _ref3;
    today = Date.current();
    _ref = [this.getDate(), today.getDate()], d = _ref[0], dc = _ref[1];
    _ref2 = [this.getMonth(), today.getMonth()], m = _ref2[0], mc = _ref2[1];
    _ref3 = [this.getFullYear(), today.getFullYear()], y = _ref3[0], yc = _ref3[1];
    return (y > yc) || (y === yc && m > mc) || (y === yc && m === mc && d > dc);
  };
}).call(this);
