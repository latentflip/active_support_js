String.inflections =
  "index": "indices",
  "vertex": "vertices",
  "matrix": "matrices",
  "ox": "oxen",
  "photo": "photos",
  "information": "information",
  "equipment": "equipment",
  "mouse": "mice",
  "louse": "lice",
  "rice": "rice",
  "cow": "kine"

String.prototype.pluralize = ->
  [s,s1,s2,s3] = [this.split(" ")[-1..-1][0], this[-1..-1], this[-2..-1]]

  return String.inflections[s] if String.inflections[s]?

  return this if s in ['fish','jeans']
  return this[0..-4]+"men" if s[-3..-1] == "man"
  return this[0..-7]+"people" if s[-6..-1] == "person"
  return this[0..-6]+"children" if s[-5..-1] == "child"

  return this+"zes" if s1 == "z"
  return this+"es" if s1 == ""

  return this[0..-2]+"ies" if s1 == "y" and s2 != "ay"

  return this[0..-3]+"i" if s2 in ["us"] and this[-3..-3] in ["r","p"]

  return this[0..-2]+"ves" if s2 in ["lf", "rf"]
  return this[0..-3]+"ves" if s2 in ["fe"]
  return this[0..-3]+"es" if s2 in ["is"]
  return this[0..-3]+"a" if s2 in ["um"]
  return this+"es" if this[-3..-1] in ["ias"]
  return this+"s" if s2 in ["io"]
  return this+"es" if s2 in ["ch", "ss", "sh", "us"] or s1 in ["x","o"]
  return this if s[-4..-1] in ["news"]
  return this if s[-3..-1] in ["ies"]
  return this if s1 == "s"
  this+"s"
