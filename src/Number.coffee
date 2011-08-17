Number.prototype.ordinalize = ->
  s = this.toString()
  last = s[s.length-1]
  next_last = s[s.length-2]

  switch last
    when "1"
      if next_last == '1' then s+"th" else s+"st"
    when "2"
      if next_last == '1' then s+"th" else s+"nd"
    when "3"
      if next_last == '1' then s+"th" else s+"rd"
    else s+"th"
