(function() {
  describe("Date", function() {
    var assert_equal;
    assert_equal = function(a, b) {
      return expect(a).toEqual(b);
    };
    beforeEach(function() {
      return this.date = new Date(2005, 01, 21);
    });
    it("should get the month name", function() {
      return assert_equal("February", this.date.monthName());
    });
    it("should get the short month name", function() {
      return assert_equal("Feb", this.date.shortMonthName());
    });
    it("should convert to strings", function() {
      assert_equal("2005-02-21", this.date.to_s());
      assert_equal("21 Feb", this.date.to_s('short'));
      assert_equal("February 21, 2005", this.date.to_s('long'));
      assert_equal("February 21st, 2005", this.date.to_s('long_ordinal'));
      assert_equal("2005-02-21", this.date.to_s('db'));
      return assert_equal("21 Feb 2005", this.date.to_s('rfc822'));
    });
    it("should change the date", function() {
      assert_equal(new Date(2005, 3, 21), new Date(2005, 3, 11).change({
        day: 21
      }));
      assert_equal(new Date(2007, 6, 11), new Date(2005, 3, 11).change({
        year: 2007,
        month: 6
      }));
      assert_equal(new Date(2006, 3, 22), new Date(2005, 3, 22).change({
        year: 2006
      }));
      assert_equal(new Date(2005, 7, 22), new Date(2005, 3, 22).change({
        month: 7
      }));
      assert_equal(new Date(2005, 0, 1), new Date(2005, 1, 15).change({
        month: 0,
        day: 1
      }));
      return assert_equal(new Date(2008, 5, 30), new Date(2008, 4, 31).change({
        month: 5
      }));
    });
    it("should move to the start of the week", function() {
      assert_equal(new Date(2005, 0, 31), new Date(2005, 1, 4).beginning_of_week());
      assert_equal(new Date(2005, 10, 28), new Date(2005, 10, 28).beginning_of_week());
      assert_equal(new Date(2005, 10, 28), new Date(2005, 10, 29).beginning_of_week());
      assert_equal(new Date(2005, 10, 28), new Date(2005, 10, 30).beginning_of_week());
      assert_equal(new Date(2005, 10, 28), new Date(2005, 11, 01).beginning_of_week());
      assert_equal(new Date(2005, 10, 28), new Date(2005, 11, 02).beginning_of_week());
      assert_equal(new Date(2005, 10, 28), new Date(2005, 11, 03).beginning_of_week());
      return assert_equal(new Date(2005, 10, 28), new Date(2005, 11, 04).beginning_of_week());
    });
    it("should move to the start of the month", function() {
      return assert_equal(new Date(2005, 2, 1), new Date(2005, 2, 22).beginning_of_month());
    });
    it("should move to the start of the quarter", function() {
      assert_equal(new Date(2005, 0, 1), new Date(2005, 1, 15).beginning_of_quarter());
      assert_equal(new Date(2005, 0, 1), new Date(2005, 0, 1).beginning_of_quarter());
      assert_equal(new Date(2005, 9, 1), new Date(2005, 11, 31).beginning_of_quarter());
      return assert_equal(new Date(2005, 3, 1), new Date(2005, 5, 30).beginning_of_quarter());
    });
    it("should move to the end of the week", function() {
      assert_equal(new Date(2008, 1, 24), new Date(2008, 1, 22).end_of_week());
      assert_equal(new Date(2008, 2, 2), new Date(2008, 1, 25).end_of_week());
      assert_equal(new Date(2008, 2, 2), new Date(2008, 1, 26).end_of_week());
      assert_equal(new Date(2008, 2, 2), new Date(2008, 1, 27).end_of_week());
      assert_equal(new Date(2008, 2, 2), new Date(2008, 1, 28).end_of_week());
      assert_equal(new Date(2008, 2, 2), new Date(2008, 1, 29).end_of_week());
      assert_equal(new Date(2008, 2, 2), new Date(2008, 2, 01).end_of_week());
      return assert_equal(new Date(2008, 2, 2), new Date(2008, 2, 02).end_of_week());
    });
    it("should move to the end of the quarter", function() {
      return assert_equal(new Date(2008, 5, 30), new Date(2008, 4, 31).end_of_quarter());
    });
    return it("should move to the end of the month", function() {
      assert_equal(new Date(2005, 2, 31), new Date(2005, 2, 20).end_of_month());
      assert_equal(new Date(2005, 1, 28), new Date(2005, 1, 20).end_of_month());
      return assert_equal(new Date(2005, 3, 30), new Date(2005, 3, 20).end_of_month());
    });
  });
}).call(this);
