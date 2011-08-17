require "rubygems"
require "bundler/setup"
require 'coffee-script'
# spec/javascripts/support/jasmine_config.rb
# when jasmine starts the server out-of-process, it needs this in order to be able to invoke the asset tasks
unless Object.const_defined?(:Rake)
  require 'rake'
  load File.expand_path('../../../../Rakefile', __FILE__)
end

module Jasmine
  class Config

    def js_files(spec_filter = nil)
      # remove all generated files
      generated_files_directory = File.expand_path("../../generated", __FILE__)
      rm_rf generated_files_directory, :secure => true

      compile_app_javascripts
      compile_jasmine_javascripts

      # this is code from the original jasmine config js_files method - you could also just alias_method_chain it
      spec_files_to_include = spec_filter.nil? ? spec_files : match_files(spec_dir, [spec_filter])
      src_files.collect {|f| "/" + f } + helpers.collect {|f| File.join(spec_path, f) } + spec_files_to_include.collect {|f| File.join(spec_path, f) }
    end

    private
    def compile_app_javascripts
      puts "Compiling lib coffee scripts into javascript..."
      root = File.expand_path("../../../../src/", __FILE__)
      destination_dir = File.expand_path("../../../../lib/javascripts", __FILE__)

      compile_coffeescript_to_javascript(root,destination_dir)
    end
    # this method compiles all of the spec files into js files that jasmine can run
    def compile_jasmine_javascripts
      puts "Compiling jasmine coffee scripts into javascript..."
      root = File.expand_path("../../../../spec/javascripts/coffee", __FILE__)
      destination_dir = File.expand_path("../../generated/specs", __FILE__)

      compile_coffeescript_to_javascript(root,destination_dir)
    end
    def compile_coffeescript_to_javascript(root,destination_dir)
      glob = File.expand_path("**/*.coffee", root)

      Dir.glob(glob).each do |srcfile|
        srcfile = Pathname.new(srcfile)
        destfile = srcfile.sub(root, destination_dir).sub(".coffee", ".js")
        FileUtils.mkdir_p(destfile.dirname)
        File.open(destfile, "w") {|f| f.write(CoffeeScript.compile(File.new(srcfile)))}
      end
    end

  end
end



# Note - this is necessary for rspec2, which has removed the backtrace
module Jasmine
  class SpecBuilder
    def declare_spec(parent, spec)
      me = self
      example_name = spec["name"]
      @spec_ids << spec["id"]
      backtrace = @example_locations[parent.description + " " + example_name]
      parent.it example_name, {} do
        me.report_spec(spec["id"])
      end
    end
  end
end
