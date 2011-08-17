@ActiveSupport = @ActiveSupport || {}
ActiveSupport.Inflections =
  plural: [
    ['(p)erson$', '\$1eople'],
    ['(m)an$', '\$1en'],
    ['(c)hild$', '\$1hildren'],
    ['(s)ex$', '\$1exes'],
    ['(m)ove$', '\$1oves'],
    ['(z)ombie$', '\$1ombies']

    ['(p)eople$', '\$1eople'],
    ['(m)en$', '\$1en'],
    ['(c)hildren$', '\$1hildren'],
    ['(s)exes$', '\$1exes'],
    ['(m)oves$', '\$1oves'],
    ['(z)ombies$', '\$1ombies']

    ['cow$', 'kine'],
    ['Cow$', 'Kine'],

    ['kine$', 'kine'],
    ['Kine$', 'Kine'],

    ["(quiz)$", '\$1zes'],
    ["^(oxen)$", '\$1'],
    ["^(ox)$", '\$1en'],
    ["([m|l])ice$", '\$1ice']
    ["([m|l])ouse$", '\$1ice']
    ["(matr|vert|ind)(?:ix|ex)$", '\$1ices'],
    ["(x|ch|ss|sh)$", '\$1es'],
    ["([^aeiouy]|qu)y$", '\$1ies']
    ["(hive)$", '\$1s'],
    ["(?:([^f])fe|([lr])f)$", '\$1\$2ves']
    ["sis$", 'ses'],
    ["([ti])a$", '\$1a']
    ["([ti])um$", '\$1a']
    ["(buffal|tomat)o$", '\$1oes'],
    ["(bu)s$", '\$1ses'],
    ["(alias|status)$", '\$1es'],
    ["(octop|vir)i$", '\$1i'],
    ["(octop|vir)us$", '\$1i'],
    ["(ax|test)is$", '\$1es'],
    ["s$", 's'],
    ["$", 's'],
  ]
  
  singular: [
    ['(p)eople$', '\$1erson'],
    ['(m)en$', '\$1an'],
    ['(c)hildren$', '\$1hild'],
    ['(s)exes$', '\$1ex'],
    ['(m)oves$', '\$1ove'],
    ['(z)ombies$', '\$1ombie']

    ['kine$', 'cow'],
    ['Kine$', 'Cow'],

    ["(database)s$", '\$1']
    ["(quiz)zes$", '\$1'],
    ["(matr)ices$", '\$1ix'],
    ["(vert|ind)ices$", '\$1ex'],
    ["^(ox)en", '\$1'],
    ["(alias|status)es$", '\$1'],
    ["(octop|vir)i$", '\$1us'],
    ["(cris|ax|test)es$", '\$1is'],
    ["(shoe)s$", '\$1'],
    ["(o)es$", '\$1'],
    ["(bus)es$", '\$1'],
    ["([m|l])ice$", '\$1ouse'],
    ["(x|ch|ss|sh)es$", '\$1'],
    ["(m)ovies$", '\$1ovie'],
    ["(s)eries$", '\$1eries'],
    ["([^aeiouy]|qu)ies$", '\$1y'],
    ["([lr])ves$", '\$1f'],
    ["(tive)s$", '\$1'],
    ["(hive)s$", '\$1'],
    ["([^f])ves$", '\$1fe'],
    ["(^analy)ses$", '\$1sis'],
    ["((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)ses$", '\$1\$2sis'],
    ["([ti])a$", '\$1um'],
    ["(n)ews$", '\$1ews'],
    ["s$", ''],
  ]

  irregular: [
    ['person', 'people'],
    ['man', 'men'],
    ['child', 'children'],
    ['sex', 'sexes'],
    ['move', 'moves'],
    ['cow', 'kine'],
    ['zombie', 'zombies']
  ]
  uncountable: [
    'equipment',
    'information',
    'rice',
    'money',
    'species',
    'series',
    'fish',
    'sheep',
    'jeans'
  ]


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


