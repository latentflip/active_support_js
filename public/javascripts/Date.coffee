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


Date.prototype.monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
Date.prototype.monthDays = [31,28,31,30,31,30,31,31,30,31,30,31]

Date.prototype.daysInMonth = () ->
  this.monthDays[ this.getMonth() ]

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
  if opts.day? and opts.month?
    d = new Date(d.setDate(1))

  d = new Date(d.setFullYear(opts.year)) if opts.year?
  d = new Date(d.setMonth(opts.month)) if opts.month?

  if opts.day?
    if opts.day > this.daysInMonth()
      throw "Invalid Date"
    else if opts.day < 0
      d = this.daysInMonth() + 1 + d

    d = new Date(d.setDate(opts.day))
  d

Date.prototype.beginning_of_week = ->
  d = this.getDay()
  if d == 0 then d=6 else d = d-1
  new Date(this.getTime() - (d)*24*3600*1000)

Date.prototype.end_of_week = ->
  d = this.getDay()
  if d == 0 then d=0 else d = 7-d
  new Date(this.getTime() + (d)*24*3600*1000)

Date.prototype.beginning_of_month = ->
  new Date(this.setDate(1))

Date.prototype.beginning_of_quarter = ->
  m = this.getMonth()
  new_m = 9 if m>=9
  new_m ?= 6 if m>=6
  new_m ?= 3 if m>=3
  new_m ?=0 if m>=0
  this.change({day: 1, month: new_m})

Date.prototype.end_of_month = ->
  new Date(this.setDate( this.daysInMonth() ))

Date.prototype.end_of_quarter = ->
  m = this.getMonth()
  new_m = 11 if m>=9
  new_m ?= 8 if m>=6
  new_m ?= 5 if m>=3
  new_m ?=2 if m>=0
  this.change({day: -1, month: new_m})
