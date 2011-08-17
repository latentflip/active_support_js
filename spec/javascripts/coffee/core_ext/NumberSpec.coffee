OrdinalNumbers = {
  "0": "0th",
  "1": "1st",
  "2": "2nd",
  "3": "3rd",
  "4": "4th",
  "5": "5th",
  "6": "6th",
  "7": "7th",
  "8": "8th",
  "9": "9th",
  "10": "10th",
  "11": "11th",
  "12": "12th",
  "13": "13th",
  "14": "14th",
  "20": "20th",
  "21": "21st",
  "22": "22nd",
  "23": "23rd",
  "24": "24th",
  "100": "100th",
  "101": "101st",
  "102": "102nd",
  "103": "103rd",
  "104": "104th",
  "110": "110th",
  "111": "111th",
  "112": "112th",
  "113": "113th",
  "1000": "1000th",
  "1001": "1001st"
}


describe "Number", ->
  assert_equal = (a,b) ->
    expect(a).toEqual(b);
  assert_not_equal = (a,b) ->
    expect(a).toNotEqual(b);

  assert_ordinalize = (s,n) ->
    assert_equal s, n.ordinalize()

  assert_not_ordinalize = (s,n) ->
    assert_not_equal s, n.ordinalize()

  it "should ordinalize numbers", ->
    for n,o of OrdinalNumbers
      do ->
        assert_equal o, parseInt(n).ordinalize()

