describe "Date", ->
  assert_equal = (a,b) ->
    expect(a).toEqual(b);

  beforeEach ->
    @date = new Date(2005,01,21) #NB this is february!

  it "should get the month name", ->
    assert_equal "February", @date.monthName()

  it "should get the short month name", ->
    assert_equal "Feb", @date.shortMonthName()

  it "should convert to strings", ->
    assert_equal "2005-02-21",          @date.to_s()
    assert_equal "21 Feb",              @date.to_s('short')
    assert_equal "February 21, 2005",   @date.to_s('long')
    assert_equal "February 21st, 2005", @date.to_s('long_ordinal')
    assert_equal "2005-02-21",          @date.to_s('db')
    assert_equal "21 Feb 2005",         @date.to_s('rfc822')

  it "should change the date", ->
    assert_equal new Date(2005, 3, 21), new Date(2005, 3, 11).change({day: 21})
    assert_equal new Date(2007, 6, 11), new Date(2005, 3, 11).change({year: 2007, month: 6})
    assert_equal new Date(2006,3,22),   new Date(2005,3,22).change({year: 2006})
    assert_equal new Date(2005,7,22),   new Date(2005,3,22).change({month: 7})
    assert_equal new Date(2005,0,1),  new Date(2005,1,15).change({month: 0, day: 1})
    assert_equal new Date(2008,5,30),  new Date(2008,4,31).change({month: 5})


  it "should move to the start of the week", ->
    assert_equal new Date(2005,0,31),  new Date(2005,1,4).beginning_of_week()
    assert_equal new Date(2005,10,28), new Date(2005,10,28).beginning_of_week() #monday
    assert_equal new Date(2005,10,28), new Date(2005,10,29).beginning_of_week() #tuesday
    assert_equal new Date(2005,10,28), new Date(2005,10,30).beginning_of_week() #wednesday
    assert_equal new Date(2005,10,28), new Date(2005,11,01).beginning_of_week() #thursday
    assert_equal new Date(2005,10,28), new Date(2005,11,02).beginning_of_week() #friday
    assert_equal new Date(2005,10,28), new Date(2005,11,03).beginning_of_week() #saturday
    assert_equal new Date(2005,10,28), new Date(2005,11,04).beginning_of_week() #sunday

  it "should move to the start of the month", ->
    assert_equal new Date(2005,2,1), new Date(2005,2,22).beginning_of_month()

  it "should move to the start of the quarter", ->
    assert_equal new Date(2005,0,1),  new Date(2005,1,15).beginning_of_quarter()
    assert_equal new Date(2005,0,1),  new Date(2005,0,1).beginning_of_quarter()
    assert_equal new Date(2005,9,1), new Date(2005,11,31).beginning_of_quarter()
    assert_equal new Date(2005,3,1),  new Date(2005,5,30).beginning_of_quarter()

  it "should move to the end of the week", ->
    assert_equal new Date(2008,1,24), new Date(2008,1,22).end_of_week()
    assert_equal new Date(2008,2,2), new Date(2008,1,25).end_of_week() #monday 1
    assert_equal new Date(2008,2,2), new Date(2008,1,26).end_of_week() #tuesday 2
    assert_equal new Date(2008,2,2), new Date(2008,1,27).end_of_week() #wednesday 3
    assert_equal new Date(2008,2,2), new Date(2008,1,28).end_of_week() #thursday 4
    assert_equal new Date(2008,2,2), new Date(2008,1,29).end_of_week() #friday 5
    assert_equal new Date(2008,2,2), new Date(2008,2,01).end_of_week() #saturday 6
    assert_equal new Date(2008,2,2), new Date(2008,2,02).end_of_week() #sunday 0
    
  it "should move to the end of the quarter", ->
    #assert_equal new Date(2008,2,31),  new Date(2008,1,15).end_of_quarter()
    #assert_equal new Date(2008,2,31),  new Date(2008,2,31).end_of_quarter()
    #assert_equal new Date(2008,11,31), new Date(2008,9,8).end_of_quarter()
    #assert_equal new Date(2008,5,30),  new Date(2008,3,14).end_of_quarter()
    assert_equal new Date(2008,5,30),  new Date(2008,4,31).end_of_quarter()
    #assert_equal new Date(2008,8,30),  new Date(2008,7,21).end_of_quarter()
    
  it "should move to the end of the month", ->
    assert_equal new Date(2005,2,31), new Date(2005,2,20).end_of_month()
    assert_equal new Date(2005,1,28), new Date(2005,1,20).end_of_month()
    assert_equal new Date(2005,3,30), new Date(2005,3,20).end_of_month()
    
