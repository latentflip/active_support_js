describe "ActiveSupport", ->
  assert_equal = (a,b) ->
    expect(a).toEqual(b)
  assert = (a) ->
    expect(true).toEqual(a)
  
  it "should test_zero_pad", ->
    assert_equal "0004", ActiveSupport.zeroPad(4,4)
    assert_equal "4444", ActiveSupport.zeroPad(4444,4)
    assert_equal "44444", ActiveSupport.zeroPad(44444,4)
