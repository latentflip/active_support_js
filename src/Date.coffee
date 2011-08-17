#ActiveSupport =
#  zeroPad: (number,width) ->
#    return "0"+number
#    width -= number.toString().length
#    
#    if width > 0
#      return new Array(width + (/\./.test( number ) ? 2 : 1).join('0') + number
#    else
#      return number

ActiveSupport = {}
ActiveSupport.zeroPad = (number,width) ->
  width = width - number.toString().length
  if width > 0 
    return new Array(width + 1).join('0') + number
  else number


Date.prototype.dayNames = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday', 'sunday']
Date.prototype.monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
Date.prototype.monthDays = [31,28,31,30,31,30,31,31,30,31,30,31]

Date.prototype.isLeapYear = () ->
  y = this.getFullYear()
  return true if (y%400) == 0
  return false if (y%100) == 0
  return true if (y%4) == 0
  false

Date.prototype.daysInMonth = () ->
  m = this.getMonth()
  d = this.monthDays[m]
  if (m==1 and this.isLeapYear()) then d+1 else d

Date.prototype.monthName = () ->
  this.monthNames[this.getMonth()]

Date.prototype.shortMonthName = () ->
  this.monthName()[0..2]

Date.prototype.to_s = (opt) ->
  switch opt
    when 'short' then "#{this.getDate()} #{this.shortMonthName()}"
    when 'long' then "#{this.monthName()} #{this.getDate()}, #{this.getFullYear()}"
    when 'long_ordinal', 'longOrdinal' then "#{this.monthName()} #{this.getDate().ordinalize()}, #{this.getFullYear()}"
    when 'rfc822' then "#{this.getDate()} #{this.shortMonthName()} #{this.getFullYear()}"
    when undefined, 'db' then "#{this.getFullYear()}-#{ActiveSupport.zeroPad(this.getMonth()+1,2)}-#{this.getDate()}"

Date.prototype.change = (opts) ->
  d = this
  day = opts.day || d.getDate()

  #Set the date to 1 before we change the month and year
  d = new Date(d.setDate(1))

  d = new Date(d.setFullYear(opts.year)) if opts.year?
  d = new Date(d.setMonth(opts.month)) if opts.month?

  if day > d.daysInMonth()
    throw "Invalid Date"
  else if opts.day < 0
    day = d.daysInMonth() + 1 + day

  d = new Date(d.setDate(day))
  d

Date.prototype.beginning_of_week = ->
  d = this.getDay()
  if d == 0 then d=6 else d = d-1
  this.addDays(-1*d)

Date.prototype.end_of_week = ->
  d = this.getDay()
  if d == 0 then d=0 else d = 7-d
  this.addDays(d)

Date.prototype.beginning_of_month = ->
  new Date(this.setDate(1))

Date.prototype.end_of_month = ->
  new Date(this.setDate( this.daysInMonth() ))


Date.prototype.beginning_of_quarter = ->
  m = this.getMonth()
  new_m = 9 if m>=9
  new_m ?= 6 if m>=6
  new_m ?= 3 if m>=3
  new_m ?=0 if m>=0
  this.change({day: 1, month: new_m})


Date.prototype.end_of_quarter = ->
  m = this.getMonth()
  new_m = 11 if m>=9
  new_m ?= 8 if m>=6
  new_m ?= 5 if m>=3
  new_m ?=2 if m>=0
  this.change({day: -1, month: new_m})


Date.prototype.beginning_of_year = ->
  this.change({month: 0, day: 1})

Date.prototype.end_of_year = ->
  this.change({month: 11, day: 31})

#Acts like >> in ruby
Date.prototype.addMonths = (n) ->
  day = this.getDate()

  date = this.change({day: 1})
  date = date.change({month: date.getMonth()+n})

  day = date.daysInMonth() if (day>date.daysInMonth())
  date = date.change({day: day})
  date

Date.prototype.addDays = (n) ->
  new Date(this.getTime() + n*24*3600*1000)

Date.prototype.advance = (opts) ->
  d = this
  d = d.addMonths(12*opts.years) if opts.years?
  d = d.addMonths(opts.months) if opts.months?
  d = d.addDays(7*opts.weeks) if opts.weeks?
  d = d.addDays(opts.days) if opts.days?
  d

Date.prototype.days_ago = (n) ->
  new Date(this.getTime() - (n)*24*3600*1000)

Date.prototype.days_since = (n) ->
  new Date(this.getTime() + (n)*24*3600*1000)

Date.prototype.weeks_ago = (n) ->
  new Date(this.getTime() - (n)*7*24*3600*1000)

Date.prototype.weeks_since = (n) ->
  new Date(this.getTime() + (n)*7*24*3600*1000)

Date.prototype.change_week_day = (newDay) ->
  d = this.beginning_of_week()
  d = d.addDays(this.dayNames.indexOf(newDay))
  d

Date.prototype.next_week = (newDay) ->
  newDay = 'monday' unless newDay?
  console.log(this)
  d = this.weeks_since(1)
  console.log(d)
  d = d.change_week_day(newDay)
  console.log(d)
  d

Date.prototype.prev_week = (newDay) ->
  newDay = 'monday' unless newDay?
  d = this.weeks_ago(1).change_week_day(newDay)
  d

Date.prototype.months_ago = (n) ->
  this.advance({months: -1*n})

Date.prototype.months_since = (n) ->
  this.advance({months: n})

Date.prototype.years_ago = (n) ->
  this.advance({years: -1*n})

Date.prototype.years_since = (n) ->
  this.advance({years: n})

Date.prototype.prev_year = ->
  this.years_ago(1)

Date.prototype.next_year = ->
  this.years_since(1)

Date.prototype.next_month = ->
  this.months_since(1)

Date.prototype.prev_month = ->
  this.months_ago(1)

Date.prototype.yesterday = ->
  this.days_ago(1)

Date.prototype.tomorrow = ->
  this.days_since(1)

Date.current = ->
  Date.today()

Date.today = ->
  new Date()

Date.yesterday = ->
  new Date().yesterday()

Date.tomorrow = ->
  console.log('t',new Date())
  console.log('t',new Date().tomorrow())
  new Date().tomorrow()

Date.prototype.isPast = ->
  today = Date.current()
  [d,dc] = [this.getDate(), today.getDate()]
  [m,mc] = [this.getMonth(), today.getMonth()]
  [y,yc] = [this.getFullYear(), today.getFullYear()]
  
  (y<yc) || (y==yc and m<mc) || (y==yc and m==mc and d<dc)

Date.prototype.isToday = ->
  today = Date.current()
  d = this.getDate()==today.getDate()
  m = this.getMonth()==today.getMonth()
  y = this.getFullYear()==today.getFullYear()

  d and m and y

Date.prototype.isFuture = ->
  today = Date.current()
  [d,dc] = [this.getDate(), today.getDate()]
  [m,mc] = [this.getMonth(), today.getMonth()]
  [y,yc] = [this.getFullYear(), today.getFullYear()]

  (y>yc) || (y==yc and m>mc) || (y==yc and m==mc and d>dc)

