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

    it "should test_singularize", ->
      for singular, plural of InflectorTestCases.SingularToPlural
        do ->
          assert_equal(singular, plural.singularize())

    it "should test_capitalize", ->
      assert_equal "Capitalized", "capitalized".capitalize()
      assert_equal "3caps", "3caps".capitalize()
      assert_equal ".caps", ".caps".capitalize()


    it "should test_titleize", ->
      for before, titleized of InflectorTestCases.MixtureToTitleCase
        do ->
          assert_equal(titleized, before.titleize())

    it "should test_camelize", ->
      for camel, underscore of InflectorTestCases.CamelToUnderscore
        do ->
          assert_equal(camel, underscore.camelize())

    it "should test_camelize_lower", ->
      assert_equal('capital', 'Capital'.camelize('lower'))

    it "should test_underscore", ->
      for camel, underscore of InflectorTestCases.CamelToUnderscore
        do ->
          assert_equal(underscore, camel.underscore())
      assert_equal "html_tidy", "HTMLTidy".underscore()
      assert_equal "html_tidy_generator", "HTMLTidyGenerator".underscore()


    it "should test_underscore_to_lower_camel", ->
      for underscored, lower_camel of InflectorTestCases.UnderscoreToLowerCamel
        do ->
          assert_equal(lower_camel, underscored.camelize('lower'))

    it "should test_demodulize", ->
      assert_equal "Account", "MyApplication::Billing::Account".demodulize()


    it "should test_foreign_key", ->
      for klass, foreign_key of InflectorTestCases.ClassNameToForeignKeyWithUnderscore
        do ->
          assert_equal(foreign_key, klass.foreign_key())

    it "should test_foreign_key without underscore", ->
      for klass, foreign_key of InflectorTestCases.ClassNameToForeignKeyWithoutUnderscore
        do ->
          assert_equal(foreign_key, klass.foreign_key(false))


    it "should test_tableize", ->
      for class_name, table_name of InflectorTestCases.ClassNameToTableName
        do ->
          assert_equal(table_name, class_name.tableize())


    #it "should test_classify", ->
    #  for class_name, table_name of InflectorTestCases.ClassNameToTableName
    #    do ->
    #      assert_equal(class_name, table_name.classify())


    it "should test_string_parameterized_normal", ->
      for normal, slugged of InflectorTestCases.StringToParameterized
        do ->
          assert_equal(normal.parameterize(), slugged)


    it "should test_string_parameterized_no_separator", ->
      for normal, slugged of InflectorTestCases.StringToParameterizeWithNoSeparator
        do ->
          assert_equal(normal.parameterize(''), slugged)

    it "should test_string_parameterized_underscore", ->
      for normal, slugged of InflectorTestCases.StringToParameterizeWithUnderscore
        do ->
        assert_equal(normal.parameterize('_'), slugged)

    it "should test_humanize", ->
      for underscore, human of InflectorTestCases.UnderscoreToHuman
        do ->
        assert_equal(human, underscore.humanize())

    it "should test_ord", ->
      assert_equal 97, 'a'.ord()
      assert_equal 97, 'abc'.ord()

