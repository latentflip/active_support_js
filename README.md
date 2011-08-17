# Rails' ActiveSupport in JavaScript

* **This is very much a work in progress**, please fork, play, contribute - but don't use it in production yet
* I'm pretty much just copying the specs from https://github.com/rails/rails/blob/master/activesupport, converting them to coffeescript and trying to get them running
* I appreciate that: "Can be a bit of a no-no. JavaScripters aren't natural monkey-patchers." - @froots101 but I'm going to try anyway and see what happens.


## Getting the specs running

The repo uses Jasmine and the ruby Jasmine gem to make life easy. The lib and specs are all written in coffeescript so you will need to have a coffeescript compiler installed

* `git clone git://github.com/latentflip/active_support_js.git`
* `cd active_support_js`
* If you have bundler installed:
  * `bundle install`
* If you don't have bundler:
  * `gem install jasmine`
* Start your coffeescript compiler:
  * `coffee -wc spec/* public/*`
* Start jasmine, either:
  * `rake jasmine` - to run and view the specs in a browser
  * `rake jasmine:ci` - to run and view the specs at the command line

# All contributions welcome :)
