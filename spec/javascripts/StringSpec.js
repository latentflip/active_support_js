(function() {
  describe("String", function() {
    var assert, assert_equal;
    assert_equal = function(a, b) {
      return expect(a).toEqual(b);
    };
    assert = function(a) {
      return expect(true).toEqual(a);
    };
    return describe("Infections", function() {
      return it("should test_pluralize", function() {
        var plural, singular, _fn, _ref;
        _ref = InflectorTestCases.SingularToPlural;
        _fn = function() {
          return assert_equal(plural, singular.pluralize());
        };
        for (singular in _ref) {
          plural = _ref[singular];
          _fn();
        }
        return assert_equal("plurals", "plurals".pluralize());
      });
    });
  });
}).call(this);
