describe "Date", ->
  assert_equal = (a,b) ->
    expect(a).toEqual(b)
  assert = (a) ->
    expect(true).toEqual(a)

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

  it "should test for leap years", ->
    #leap years
    assert new Date(2000,0,1).isLeapYear()
    assert new Date(2004,0,1).isLeapYear()
    #not leap years
    assert !new Date(2100,0,1).isLeapYear()
    assert !new Date(2003,0,1).isLeapYear()

  it "should get the number of days in the month (excluding February)", ->
    assert_equal 31, new Date(2000,0,1).daysInMonth()
    assert_equal 31, new Date(2000,2,1).daysInMonth()
    assert_equal 30, new Date(2000,3,1).daysInMonth()
    assert_equal 31, new Date(2000,4,1).daysInMonth()
    assert_equal 30, new Date(2000,5,1).daysInMonth()
    assert_equal 31, new Date(2000,6,1).daysInMonth()
    assert_equal 31, new Date(2000,7,1).daysInMonth()
    assert_equal 30, new Date(2000,8,1).daysInMonth()
    assert_equal 31, new Date(2000,9,1).daysInMonth()
    assert_equal 30, new Date(2000,10,1).daysInMonth()
    assert_equal 31, new Date(2000,11,1).daysInMonth()

  it "should get the number of days in the month for February", ->
    #not leap year
    assert_equal 28, new Date(2003,1,1).daysInMonth()
    #leap year
    assert_equal 29, new Date(2004,1,1).daysInMonth()

  it "should change the date", ->
    assert_equal new Date(2005, 3, 21), new Date(2005, 3, 11).change({day: 21})
    assert_equal new Date(2007, 6, 11), new Date(2005, 3, 11).change({year: 2007, month: 6})
    assert_equal new Date(2006,3,22),   new Date(2005,3,22).change({year: 2006})
    assert_equal new Date(2005,7,22),   new Date(2005,3,22).change({month: 7})
    assert_equal new Date(2005,0,1),  new Date(2005,1,15).change({month: 0, day: 1})

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
    assert_equal new Date(2008,2,31),  new Date(2008,1,15).end_of_quarter()
    assert_equal new Date(2008,2,31),  new Date(2008,2,31).end_of_quarter()
    assert_equal new Date(2008,11,31), new Date(2008,9,8).end_of_quarter()
    assert_equal new Date(2008,5,30),  new Date(2008,3,14).end_of_quarter()
    assert_equal new Date(2008,5,30),  new Date(2008,4,31).end_of_quarter()
    assert_equal new Date(2008,8,30),  new Date(2008,7,21).end_of_quarter()

  it "should move to the end of the year", ->
    assert_equal new Date(2008,11,31), new Date(2008,2,22).end_of_year()

  it "should move to the end of the month", ->
    assert_equal new Date(2005,2,31), new Date(2005,2,20).end_of_month()
    assert_equal new Date(2005,1,28), new Date(2005,1,20).end_of_month()
    assert_equal new Date(2005,3,30), new Date(2005,3,20).end_of_month()
    
  it "should move to the start of the year", ->
    assert_equal new Date(2005,0,1), new Date(2005,1,22).beginning_of_year()
  

  it "should add x months", ->
    assert_equal new Date(2005,4,10), new Date(2005,6,10).addMonths(-2)
    assert_equal new Date(2005,4,10), new Date(2005,5,10).addMonths(-1)
    assert_equal new Date(2005,4,10), new Date(2005,3,10).addMonths(1)
    assert_equal new Date(2005,4,10), new Date(2005,2,10).addMonths(2)

    assert_equal new Date(2005,1,28), new Date(2005,2,31).addMonths(-1)

  it "should move to x weeks ago", ->
    assert_equal new Date(2005,4,10), new Date(2005,4,17).weeks_ago(1)
    assert_equal new Date(2005,4,10), new Date(2005,4,24).weeks_ago(2)
    assert_equal new Date(2005,4,10), new Date(2005,4,31).weeks_ago(3)
    assert_equal new Date(2005,4,10), new Date(2005,5,7).weeks_ago(4)
    assert_equal new Date(2006,11,31), new Date(2007,1,4).weeks_ago(5)

  it "should move to x weeks since", ->
    assert_equal new Date(2005,4,17), new Date(2005,4,10).weeks_since(1)
    assert_equal new Date(2005,4,24), new Date(2005,4,10).weeks_since(2)
    assert_equal new Date(2005,4,31), new Date(2005,4,10).weeks_since(3)
    assert_equal new Date(2005,5,7), new Date(2005,4,10).weeks_since(4)
    assert_equal new Date(2007,1,4), new Date(2006,11,31).weeks_since(5)
    assert_equal new Date(2006,9,31), new Date(2006,9,24).weeks_since(1)

  it "should move to x months ago", ->
    console.log('this')
    assert_equal new Date(2005,4,5),  new Date(2005,5,5).months_ago(1)
    assert_equal new Date(2004,10,5), new Date(2005,5,5).months_ago(7)
    assert_equal new Date(2004,11,5), new Date(2005,5,5).months_ago(6)
    assert_equal new Date(2004,5,5),  new Date(2005,5,5).months_ago(12)
    assert_equal new Date(2003,5,5),  new Date(2005,5,5).months_ago(24)

  it "should move to x months since", ->
    assert_equal new Date(2005,6,5),  new Date(2005,5,5).months_since(1)
    assert_equal new Date(2006,0,5),  new Date(2005,11,5).months_since(1)
    assert_equal new Date(2005,11,5), new Date(2005,5,5).months_since(6)
    assert_equal new Date(2006,5,5),  new Date(2005,11,5).months_since(6)
    assert_equal new Date(2006,0,5),  new Date(2005,5,5).months_since(7)
    assert_equal new Date(2006,5,5),  new Date(2005,5,5).months_since(12)
    assert_equal new Date(2007,5,5),  new Date(2005,5,5).months_since(24)
    assert_equal new Date(2005,3,30),  new Date(2005,2,31).months_since(1)
    assert_equal new Date(2005,1,28),  new Date(2005,0,29).months_since(1)
    assert_equal new Date(2005,1,28),  new Date(2005,0,30).months_since(1)
    assert_equal new Date(2005,1,28),  new Date(2005,0,31).months_since(1)
    
  it "should move to x years ago", ->
    assert_equal new Date(2004,5,5),  new Date(2005,5,5).years_ago(1)
    assert_equal new Date(1998,5,5), new Date(2005,5,5).years_ago(7)
    assert_equal new Date(2003,1,28), new Date(2004,1,29).years_ago(1) # 1 year ago from leap day

  it "should move to x years since", ->
    assert_equal new Date(2006,5,5),  new Date(2005,5,5).years_since(1)
    assert_equal new Date(2012,5,5),  new Date(2005,5,5).years_since(7)
    assert_equal new Date(2182,5,5),  new Date(2005,5,5).years_since(177)
    assert_equal new Date(2005,1,28), new Date(2004,1,29).years_since(1) # 1 year since leap day
    
  it "should test_prev_year", ->
    assert_equal new Date(2004,5,5), new Date(2005,5,5).prev_year()


  it "should test_prev_year_in_leap_years", ->
    assert_equal new Date(1999,1,28), new Date(2000,1,29).prev_year()


  #it "should test_prev_year_in_calendar_reform", ->
  #  assert_equal new Date(1582,9,4), new Date(1583,9,14).prev_year()


  it "should test_next_year", ->
    assert_equal new Date(2006,5,5), new Date(2005,5,5).next_year()


  it "should test_next_year_in_leap_years", ->
    assert_equal new Date(2001,1,28), new Date(2000,1,29).next_year()


  #it "should test_next_year_in_calendar_reform", ->
  #  assert_equal new Date(1582,9,4), new Date(1581,9,10).next_year()


  it "should test_yesterday", ->
    assert_equal new Date(2005,1,21), new Date(2005,1,22).yesterday()
    assert_equal new Date(2005,1,28), new Date(2005,2,2).yesterday().yesterday()


  #it "should test_yesterday_in_calendar_reform", ->
  #  assert_equal new Date(1582,9,4), new Date(1582,9,15).yesterday()


  it "should test_tomorrow", ->
    assert_equal new Date(2005,1,23), new Date(2005,1,22).tomorrow()
    assert_equal new Date(2005,2,2),  new Date(2005,1,28).tomorrow().tomorrow()

  #it "should test_tomorrow_in_calendar_reform", ->
  #  assert_equal new Date(1582,9,15), new Date(1582,9,4).tomorrow()


  it "should test_advance", ->
    assert_equal new Date(2006,1,28), new Date(2005,1,28).advance({years: 1})
    assert_equal new Date(2005,5,28), new Date(2005,1,28).advance({months: 4})
    assert_equal new Date(2005,2,21), new Date(2005,1,28).advance({weeks: 3})
    assert_equal new Date(2005,2,5), new Date(2005,1,28).advance({days: 5})
    assert_equal new Date(2012,8,28), new Date(2005,1,28).advance({years: 7, months: 7})
    assert_equal new Date(2013,9,3), new Date(2005,1,28).advance({years: 7, months: 19, days: 5})
    assert_equal new Date(2013,9,17), new Date(2005,1,28).advance({years: 7, months: 19, weeks: 2, days: 5})
    assert_equal new Date(2005,1,28), new Date(2004,1,29).advance({years: 1}) #leap day plus one year


  it "should test_advance_does_first_years_and_then_days", ->
    assert_equal new Date(2012, 1, 29), new Date(2011, 1, 28).advance({years: 1, days: 1})
    # If day was done first we would jump to 2012-03-01 instead.


  it "should test_advance_does_first_months_and_then_days", ->
    assert_equal new Date(2010, 2, 29), new Date(2010, 1, 28).advance({months: 1, days: 1})
    # If day was done first we would jump to 2010-04-01 instead.


  #it "should test_advance_in_calendar_reform", ->
  #  assert_equal new Date(1582,9,15), new Date(1582,9,4).advance({days => 1)
  #  assert_equal new Date(1582,9,4), new Date(1582,9,15).advance({days => -1)
  #  5.upto(14) do |day|
  #    assert_equal new Date(1582,9,4), new Date(1582,8,day).advance({months => 1)
  #    assert_equal new Date(1582,9,4), new Date(1582,10,day).advance({months => -1)
  #    assert_equal new Date(1582,9,4), new Date(1581,9,day).advance({years => 1)
  #    assert_equal new Date(1582,9,4), new Date(1583,9,day).advance({years => -1)



  it "should test_prev_week", ->
    assert_equal new Date(2005,4,9), new Date(2005,4,17).prev_week()
    assert_equal new Date(2006,11,25), new Date(2007,0,7).prev_week()
    assert_equal new Date(2010,1,12), new Date(2010,1,19).prev_week('friday')
    assert_equal new Date(2010,1,13), new Date(2010,1,19).prev_week('saturday')
    assert_equal new Date(2010,1,27), new Date(2010,2,4).prev_week('saturday')


  it "should test_next_week", ->
    #assert_equal new Date(2005,1,28), new Date(2005,1,22).next_week()
    #assert_equal new Date(2005,2,4), new Date(2005,1,22).next_week('friday')
    assert_equal new Date(2006,9,30), new Date(2006,9,23).next_week()
    #assert_equal new Date(2006,10,1), new Date(2006,9,23).next_week('wednesday')


  #it "should test_next_week_in_calendar_reform", ->
  #  assert_equal new Date(1582,9,15), new Date(1582,8,30).next_week('friday')
  #  assert_equal new Date(1582,9,18), new Date(1582,9,4).next_week()


  it "should test_next_month_on_31st", ->
    assert_equal new Date(2005, 8, 30), new Date(2005, 7, 31).next_month()


  it "should test_prev_month_on_31st", ->
    assert_equal new Date(2004, 1, 29), new Date(2004, 2, 31).prev_month()


  it "should test_yesterday_constructor", ->
    assert_equal new Date(Date.current().getTime() - 24*3600*1000), Date.yesterday()

  it "should test_tomorrow_constructor", ->
    assert_equal new Date(Date.current().getTime() + 24*3600*1000), Date.tomorrow()

  it "should test_today", ->
    spyOn(Date, 'current').andReturn(new Date(2000,0,1))
    assert_equal false, new Date(1999,11,31).isToday()
    assert_equal true, new Date(2000,0,1).isToday()
    assert_equal false, new Date(2000,0,2).isToday()

  it "should test_past", ->
    spyOn(Date, 'current').andReturn(new Date(2000,0,1))
    assert_equal true, new Date(1999,11,31).isPast()
    assert_equal false, new Date(2000,0,1).isPast()
    assert_equal false, new Date(2000,0,2).isPast()

  it "test_future", ->
    spyOn(Date, 'current').andReturn(new Date(2000,0,1))
    assert_equal false, new Date(1999,11,31).isFuture()
    assert_equal false, new Date(2000,0,1).isFuture()
    assert_equal true, new Date(2000,0,2).isFuture()


