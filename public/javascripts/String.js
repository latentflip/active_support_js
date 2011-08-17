(function() {
  String.inflections = {
    "index": "indices",
    "vertex": "vertices",
    "matrix": "matrices",
    "ox": "oxen",
    "photo": "photos",
    "information": "information",
    "equipment": "equipment",
    "mouse": "mice",
    "louse": "lice",
    "rice": "rice",
    "cow": "kine"
  };
  String.prototype.pluralize = function() {
    var s, s1, s2, s3, _ref, _ref2, _ref3, _ref4, _ref5;
    _ref = [this.split(" ").slice(-1)[0], this.slice(-1), this.slice(-2)], s = _ref[0], s1 = _ref[1], s2 = _ref[2], s3 = _ref[3];
    if (String.inflections[s] != null) {
      return String.inflections[s];
    }
    if (s === 'fish' || s === 'jeans') {
      return this;
    }
    if (s.slice(-3) === "man") {
      return this.slice(0, -3) + "men";
    }
    if (s.slice(-6) === "person") {
      return this.slice(0, -6) + "people";
    }
    if (s.slice(-5) === "child") {
      return this.slice(0, -5) + "children";
    }
    if (s1 === "z") {
      return this + "zes";
    }
    if (s1 === "") {
      return this + "es";
    }
    if (s1 === "y" && s2 !== "ay") {
      return this.slice(0, -1) + "ies";
    }
    if ((s2 === "us") && ((_ref2 = this.slice(-3, -2)) === "r" || _ref2 === "p")) {
      return this.slice(0, -2) + "i";
    }
    if (s2 === "lf" || s2 === "rf") {
      return this.slice(0, -1) + "ves";
    }
    if (s2 === "fe") {
      return this.slice(0, -2) + "ves";
    }
    if (s2 === "is") {
      return this.slice(0, -2) + "es";
    }
    if (s2 === "um") {
      return this.slice(0, -2) + "a";
    }
    if ((_ref3 = this.slice(-3)) === "ias") {
      return this + "es";
    }
    if (s2 === "io") {
      return this + "s";
    }
    if ((s2 === "ch" || s2 === "ss" || s2 === "sh" || s2 === "us") || (s1 === "x" || s1 === "o")) {
      return this + "es";
    }
    if ((_ref4 = s.slice(-4)) === "news") {
      return this;
    }
    if ((_ref5 = s.slice(-3)) === "ies") {
      return this;
    }
    if (s1 === "s") {
      return this;
    }
    return this + "s";
  };
}).call(this);
