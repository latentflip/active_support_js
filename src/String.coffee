String.prototype.singularize = ->
  word = this.toString()
  result = this.toString()

  newResult = false
  for inflection in ActiveSupport.Inflections.uncountable
    unless newResult
      r = new RegExp('('+inflection+')$', 'i')
      console.log(result, r, result.match(r))
      newResult = result if result.match(r)
      
  console.log(word, newResult)
  return newResult if newResult

  for singular in ActiveSupport.Inflections.singular
    do ->
      if !newResult
        [regex,replacement] = singular
        r = new RegExp(regex, 'ig')
        newResult = result.replace(r,replacement) if result.match(r)

  console.log(word, newResult)
  return newResult
  

String.prototype.pluralize = ->
  word = this.toString()
  result = this.toString()
  
  if (word.length == 0) || (result.toLowerCase() in ActiveSupport.Inflections.uncountable)
    return result
  else
    newResult = false
    for plural in ActiveSupport.Inflections.plural
      do ->
        if !newResult
          [regex,replacement] = plural
          r = new RegExp(regex, 'ig')
          newResult = result.replace(r,replacement) if result.match(r)

    return newResult


String.prototype.capitalize = ->
  this[0..0].toUpperCase() + this[1..-1]



String.prototype.titleize = ->
  ns = (word.capitalize() for word in this.split(/[\s_]/)).join(' ')
  ns.replace(/([a-z0-9])(?=[A-Z])/g, '\$1 ')

String.prototype.camelize = (lower) ->
  ns = this.titleize().replace(/\s/,'').toString()
  ns = ns[0..0].toLowerCase() + ns[1..-1] if lower
  ns


String.prototype.underscore = ->
  ns = this.replace(/([a-z0-9])(?=[A-Z])/g, '\$1_')
  ns = ns.replace(/([A-Z])([A-Z])(?=[a-z])/g, '\$1_\$2')
  ns = ns.replace(/\s+/,/_/)
  ns = ns.toLowerCase()
  ns.toString()


String.prototype.demodulize = ->
  this.split('::')[-1..-1].toString()


String.prototype.foreign_key = (underscore)->
  u = "_"
  u = "" if underscore==false
  [this.underscore().demodulize(), 'id'].join(u)

String.prototype.tableize = ->
  this.underscore().pluralize().toString()

#Have to do singularize first
#String.prototype.classify = ->
#
String.prototype.parameterize = (seperator) ->
  seperator = '-' unless seperator?
  this.replace(/[^A-Za-z\s_-]/g, '').replace(/\s+/g, seperator).toLowerCase()

String.prototype.humanize = ->
  this.replace('_id','').replace('_',' ').capitalize()

String.prototype.ord = ->
  this.charCodeAt(0)


