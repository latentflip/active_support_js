describe "String", ->
  assert_equal = (a,b) ->
    expect(a).toEqual(b)
  assert = (a) ->
    expect(true).toEqual(a)

  describe "Infections", ->
    it "should test_pluralize", ->
      for singular, plural of InflectorTestCases.SingularToPlural
        do ->
          assert_equal plural, singular.pluralize()

      assert_equal "plurals", "plurals".pluralize()

