# Rails' ActiveSupport in JavaScript

* **This is very much a work in progress**, please fork, play, contribute - but don't use it in production yet
* I'm pretty much just copying the specs from https://github.com/rails/rails/blob/master/activesupport, converting them to coffeescript and trying to get them running
* I appreciate that: "Can be a bit of a no-no. JavaScripters aren't natural monkey-patchers." - @froots101 but I'm going to try anyway and see what happens.


## Status

* Initially focussing on the [https://github.com/rails/rails/tree/master/activesupport/test/core_ext](core_ext) tests

* [https://github.com/rails/rails/blob/master/activesupport/test/core_ext/date_ext_test.rb](core_ext/date_ext) - mostly complete, but some timezone issues:
  * methods explicitly talking about timezones haven't been looked at
  * methods which cross BST boundaries currently break
  * not all specs have been copied across
* [https://github.com/rails/rails/blob/master/activesupport/test/core_ext/string_ext_test.rb](core_ext/string_ext):
  * most of the inflection specs are in and pass
  * exception of some UTF8 specs
  * not all specs have been copied across

## Getting the specs running

The repo uses Jasmine and the ruby Jasmine gem to make life easy. The lib and specs are all written in coffeescript so you will need to have a coffeescript compiler installed

* `git clone git://github.com/latentflip/active_support_js.git`
* `cd active_support_js`
* If you don't have bundler:
  * `gem install bundler`
* `bundle install`
* Start jasmine, either:
  * `rake jasmine` - to run and view the specs in a browser
  * `rake jasmine:ci` - to run and view the specs at the command line
* CoffeeScripts will be compiled each time the specs are run.

# All contributions welcome :)
