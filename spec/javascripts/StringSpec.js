(function() {
  describe("String", function() {
    var assert, assert_equal;
    assert_equal = function(a, b) {
      return expect(a).toEqual(b);
    };
    assert = function(a) {
      return expect(true).toEqual(a);
    };
    return describe("Infections", function() {
      it("should test_pluralize", function() {
        var plural, singular, _fn, _ref;
        _ref = InflectorTestCases.SingularToPlural;
        _fn = function() {
          return assert_equal(plural, singular.pluralize());
        };
        for (singular in _ref) {
          plural = _ref[singular];
          _fn();
        }
        return assert_equal("plurals", "plurals".pluralize());
      });
      it("should test_singularize", function() {
        var plural, singular, _ref, _results;
        _ref = InflectorTestCases.SingularToPlural;
        _results = [];
        for (singular in _ref) {
          plural = _ref[singular];
          _results.push((function() {
            return assert_equal(singular, plural.singularize());
          })());
        }
        return _results;
      });
      it("should test_capitalize", function() {
        assert_equal("Capitalized", "capitalized".capitalize());
        assert_equal("3caps", "3caps".capitalize());
        return assert_equal(".caps", ".caps".capitalize());
      });
      it("should test_titleize", function() {
        var before, titleized, _ref, _results;
        _ref = InflectorTestCases.MixtureToTitleCase;
        _results = [];
        for (before in _ref) {
          titleized = _ref[before];
          _results.push((function() {
            return assert_equal(titleized, before.titleize());
          })());
        }
        return _results;
      });
      it("should test_camelize", function() {
        var camel, underscore, _ref, _results;
        _ref = InflectorTestCases.CamelToUnderscore;
        _results = [];
        for (camel in _ref) {
          underscore = _ref[camel];
          _results.push((function() {
            return assert_equal(camel, underscore.camelize());
          })());
        }
        return _results;
      });
      it("should test_camelize_lower", function() {
        return assert_equal('capital', 'Capital'.camelize('lower'));
      });
      it("should test_underscore", function() {
        var camel, underscore, _fn, _ref;
        _ref = InflectorTestCases.CamelToUnderscore;
        _fn = function() {
          return assert_equal(underscore, camel.underscore());
        };
        for (camel in _ref) {
          underscore = _ref[camel];
          _fn();
        }
        assert_equal("html_tidy", "HTMLTidy".underscore());
        return assert_equal("html_tidy_generator", "HTMLTidyGenerator".underscore());
      });
      it("should test_underscore_to_lower_camel", function() {
        var lower_camel, underscored, _ref, _results;
        _ref = InflectorTestCases.UnderscoreToLowerCamel;
        _results = [];
        for (underscored in _ref) {
          lower_camel = _ref[underscored];
          _results.push((function() {
            return assert_equal(lower_camel, underscored.camelize('lower'));
          })());
        }
        return _results;
      });
      it("should test_demodulize", function() {
        return assert_equal("Account", "MyApplication::Billing::Account".demodulize());
      });
      it("should test_foreign_key", function() {
        var foreign_key, klass, _ref, _results;
        _ref = InflectorTestCases.ClassNameToForeignKeyWithUnderscore;
        _results = [];
        for (klass in _ref) {
          foreign_key = _ref[klass];
          _results.push((function() {
            return assert_equal(foreign_key, klass.foreign_key());
          })());
        }
        return _results;
      });
      it("should test_foreign_key without underscore", function() {
        var foreign_key, klass, _ref, _results;
        _ref = InflectorTestCases.ClassNameToForeignKeyWithoutUnderscore;
        _results = [];
        for (klass in _ref) {
          foreign_key = _ref[klass];
          _results.push((function() {
            return assert_equal(foreign_key, klass.foreign_key(false));
          })());
        }
        return _results;
      });
      it("should test_tableize", function() {
        var class_name, table_name, _ref, _results;
        _ref = InflectorTestCases.ClassNameToTableName;
        _results = [];
        for (class_name in _ref) {
          table_name = _ref[class_name];
          _results.push((function() {
            return assert_equal(table_name, class_name.tableize());
          })());
        }
        return _results;
      });
      it("should test_string_parameterized_normal", function() {
        var normal, slugged, _ref, _results;
        _ref = InflectorTestCases.StringToParameterized;
        _results = [];
        for (normal in _ref) {
          slugged = _ref[normal];
          _results.push((function() {
            return assert_equal(normal.parameterize(), slugged);
          })());
        }
        return _results;
      });
      it("should test_string_parameterized_no_separator", function() {
        var normal, slugged, _ref, _results;
        _ref = InflectorTestCases.StringToParameterizeWithNoSeparator;
        _results = [];
        for (normal in _ref) {
          slugged = _ref[normal];
          _results.push((function() {
            return assert_equal(normal.parameterize(''), slugged);
          })());
        }
        return _results;
      });
      it("should test_string_parameterized_underscore", function() {
        var normal, slugged, _fn, _ref, _results;
        _ref = InflectorTestCases.StringToParameterizeWithUnderscore;
        _fn = function() {};
        _results = [];
        for (normal in _ref) {
          slugged = _ref[normal];
          _fn();
          _results.push(assert_equal(normal.parameterize('_'), slugged));
        }
        return _results;
      });
      it("should test_humanize", function() {
        var human, underscore, _fn, _ref, _results;
        _ref = InflectorTestCases.UnderscoreToHuman;
        _fn = function() {};
        _results = [];
        for (underscore in _ref) {
          human = _ref[underscore];
          _fn();
          _results.push(assert_equal(human, underscore.humanize()));
        }
        return _results;
      });
      return it("should test_ord", function() {
        assert_equal(97, 'a'.ord());
        return assert_equal(97, 'abc'.ord());
      });
    });
  });
}).call(this);
