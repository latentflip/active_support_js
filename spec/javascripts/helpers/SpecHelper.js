beforeEach(function() {
  this.addMatchers({
  })
  window.assertEqual = function(a, b) {
    expect(a).toEqual(b);
  }
});
